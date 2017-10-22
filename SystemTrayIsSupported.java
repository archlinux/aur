public class SystemTrayIsSupported {
    public static void main(String[] args) {
        System.exit(java.awt.SystemTray.isSupported() ? 0 : 1);
    }
}
