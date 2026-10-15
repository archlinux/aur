/*
 * Drive pkl-lsp in-process under GraalVM's native-image tracing agent.
 *
 * Spawning the JAR as a subprocess only records the JSON-RPC wire traffic; the
 * lsp4j reflection surface (Launcher.Builder.create() delegate discovery,
 * ServiceEndpoints.toEndpoint / toServiceObject proxy creation, GenericEndpoint
 * construction) never runs in the traced JVM, so the agent cannot observe it and
 * the resulting metadata omits it. Running the server in the same JVM that holds
 * the client exercises that surface.
 *
 * Mirrors upstream apple/pkl-lsp's simpleClientRunner
 * (src/simpleClientRunner/kotlin/org/pkl/lsp/simpleclientrunner/main.kt).
 */

import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;
import org.eclipse.lsp4j.ClientCapabilities;
import org.eclipse.lsp4j.ConfigurationParams;
import org.eclipse.lsp4j.DidOpenTextDocumentParams;
import org.eclipse.lsp4j.InitializeParams;
import org.eclipse.lsp4j.InitializedParams;
import org.eclipse.lsp4j.MessageActionItem;
import org.eclipse.lsp4j.MessageParams;
import org.eclipse.lsp4j.PublishDiagnosticsParams;
import org.eclipse.lsp4j.ShowMessageRequestParams;
import org.eclipse.lsp4j.TextDocumentItem;
import org.eclipse.lsp4j.WorkspaceClientCapabilities;
import org.eclipse.lsp4j.WorkspaceFolder;
import org.eclipse.lsp4j.jsonrpc.Launcher;
import org.eclipse.lsp4j.launch.LSPLauncher;
import org.eclipse.lsp4j.services.LanguageServer;
import org.pkl.lsp.PklLanguageClient;
import org.pkl.lsp.PklLsp;
import org.pkl.lsp.messages.ActionableNotification;

public final class RunLspAgent {

  private static final String SAMPLE_PKL =
      String.join(
              "\n",
              "class Person {",
              "  name: String",
              "  age: Int",
              "}",
              "",
              "/// This is an [unresolved reference]",
              "person: Person = new {",
              "  name = \"Alice\"",
              "}",
              "")
          + "\n";

  private static final class SimpleClient implements PklLanguageClient {
    private final BlockingQueue<PublishDiagnosticsParams> diagnostics = new ArrayBlockingQueue<>(10);

    PublishDiagnosticsParams nextDiagnostic() throws InterruptedException {
      return diagnostics.poll(3, TimeUnit.SECONDS);
    }

    @Override
    public void telemetryEvent(Object object) {}

    @Override
    public void publishDiagnostics(PublishDiagnosticsParams params) {
      diagnostics.add(params);
    }

    @Override
    public void showMessage(MessageParams params) {}

    @Override
    public CompletableFuture<MessageActionItem> showMessageRequest(
        ShowMessageRequestParams params) {
      return CompletableFuture.completedFuture(null);
    }

    @Override
    public void logMessage(MessageParams params) {}

    @Override
    public CompletableFuture<List<Object>> configuration(ConfigurationParams params) {
      List<Object> nulls = new ArrayList<>();
      for (int i = 0; i < params.getItems().size(); i++) {
        nulls.add(com.google.gson.JsonNull.INSTANCE);
      }
      return CompletableFuture.completedFuture(nulls);
    }

    @Override
    public void sendActionableNotification(ActionableNotification notification) {}
  }

  public static void main(String[] args) throws Exception {
    if (args.length < 1) {
      System.err.println("Usage: RunLspAgent <rootDir>");
      System.exit(1);
    }

    Path rootPath = Path.of(args[0]);
    Files.createDirectories(rootPath);
    String rootUri = rootPath.toUri().toString();
    Path samplePkl = rootPath.resolve("sample.pkl");
    Files.writeString(samplePkl, SAMPLE_PKL);

    PipedOutputStream clientToServerOut = new PipedOutputStream();
    PipedInputStream clientToServerIn = new PipedInputStream(clientToServerOut);
    PipedOutputStream serverToClientOut = new PipedOutputStream();
    PipedInputStream serverToClientIn = new PipedInputStream(serverToClientOut);

    Thread serverThread =
        new Thread(
            () -> PklLsp.INSTANCE.run(false, clientToServerIn, serverToClientOut), "pkl-lsp-server");
    serverThread.start();

    SimpleClient client = new SimpleClient();
    Launcher<LanguageServer> launcher =
        LSPLauncher.createClientLauncher(client, serverToClientIn, clientToServerOut);
    launcher.startListening();
    LanguageServer server = launcher.getRemoteProxy();

    InitializeParams initParams = new InitializeParams();
    initParams.setRootUri(rootUri);
    initParams.setWorkspaceFolders(List.of(new WorkspaceFolder(rootUri, "pkl-lsp")));
    WorkspaceClientCapabilities workspaceCaps = new WorkspaceClientCapabilities();
    workspaceCaps.setWorkspaceFolders(true);
    ClientCapabilities capabilities = new ClientCapabilities();
    capabilities.setWorkspace(workspaceCaps);
    initParams.setCapabilities(capabilities);

    server.initialize(initParams).get();
    server.initialized(new InitializedParams());

    server
        .getTextDocumentService()
        .didOpen(
            new DidOpenTextDocumentParams(
                new TextDocumentItem(samplePkl.toUri().toString(), "pkl", 1, SAMPLE_PKL)));

    try {
      PublishDiagnosticsParams diag = client.nextDiagnostic();
      if (diag == null) {
        System.err.println("WARNING: no diagnostic received within 3 seconds");
      }
    } finally {
      server.shutdown().get();
      server.exit();
      serverThread.join();
    }
  }
}
