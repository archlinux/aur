using System.Globalization;
using System.Text.RegularExpressions;
using CommandLine;

namespace rgx;

public static class RGX
{
    public static void Main(string[] args)
    {
        new Parser(cfg =>
            {
                cfg.CaseSensitive = false;
                cfg.CaseInsensitiveEnumValues = true;
                cfg.HelpWriter = Console.Out;
                cfg.IgnoreUnknownArguments = true;
                cfg.AutoHelp = true;
                cfg.AutoVersion = true;
                cfg.ParsingCulture = CultureInfo.InvariantCulture;
                cfg.EnableDashDash = false;
                cfg.MaximumDisplayWidth = Console.WindowWidth;
            }).ParseArguments<MatchAndReplace, Split, Group>(args)
            .WithParsed<MatchAndReplace>(RunMatch)
            .WithParsed<Split>(RunSplit)
            .WithNotParsed(Error);
    }

    private static (Regex pattern, TextReader input, TextWriter output) Prepare(ICmd cmd)
    {
        return (new Regex(cmd.pattern, (RegexOptions)cmd.options.Aggregate(0, (x, y) => x | (int)y)),
            cmd.input is not null and not ""
                ? File.Exists(cmd.input)
                    ? new StreamReader(new FileStream(cmd.input, FileMode.Open, FileAccess.Read))
                    : new StringReader(cmd.input)
                : Console.In,
            cmd.output is not null and not "" && File.Exists(cmd.output)
                ? new StreamWriter(new FileStream(cmd.output, FileMode.Truncate, FileAccess.Write))
                : Console.Out);
    }

    private static void RunMatch(MatchAndReplace cmd)
    {
        var (pattern, input, output) = Prepare(cmd);

        while (input.ReadLine() is { } line)
            if (pattern.IsMatch(line))
                output.WriteLine(cmd.replacement == null ? line : pattern.Replace(line, cmd.replacement));
            else if (cmd.useDefault)
                output.WriteLine(line);

        foreach (var res in new IDisposable[] { input, output })
            res.Dispose();
    }

    private static void RunSplit(Split cmd)
    {
        // ReSharper disable once RedundantAssignment
        var (pattern, input, output) = Prepare(cmd);

        var newPattern = cmd.pattern;
        if (newPattern.StartsWith('^'))
            // do not match beginning of string
            newPattern = newPattern.Substring(1);
        if (!newPattern.EndsWith('$'))
            newPattern += '$';
        pattern = new Regex(newPattern);
        int c;
        var buf = new StringWriter();
        while ((c = input.Read()) != -1)
        {
            buf.Write((char)c);
            var str = buf.ToString();
            if (pattern.Match(str) is not { Success: true } match)
            {
                output.Write((char)c);
                continue;
            }
            if (!string.IsNullOrWhiteSpace(str.Remove(match.Index, match.Length)))
                output.WriteLine();
            buf.Close();
            buf = new StringWriter();
        }

        foreach (var res in new IDisposable[] { input, output })
            res.Dispose();
    }

    private static void Error(IEnumerable<Error> errors)
    {
        foreach (var err in errors)
            Console.Error.WriteLine(err);
    }
}