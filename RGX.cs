using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using CommandLine;
using comroid.common;

namespace rgx;

public static class RGX
{
    private static readonly ILog log = new Log("rgx");

    static RGX()
    {
        ILog.Detail = DetailLevel.None;
    }

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
            }).ParseArguments<Arg>(args)
            .WithParsed(Run)
            .WithNotParsed(Error);
    }

    private static void Run(Arg cmd)
    {
        log.At(LogLevel.Info, "excess: " + cmd.excess);

        var pattern = new Regex(cmd.pattern, (RegexOptions)cmd.options.Aggregate(0, (x, y) => x | (int)y));
        using var input = cmd is { split: true, replacement: not null } ? new StringReader(cmd.replacement) : Console.In;
        using var output = cmd.fileOutput is not null ? new StreamWriter(new FileStream(cmd.fileOutput, FileMode.Truncate, FileAccess.Write)) : Console.Out;

        if (cmd.split)
        {
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
        }
        else
            while (input.ReadLine() is { } line)
                if (pattern.IsMatch(line))
                    output.WriteLine(cmd.replacement == null ? line : pattern.Replace(line, cmd.replacement));
    }

    private static void Error(IEnumerable<Error> errors)
    {
        foreach (var err in errors)
            log.At(err.StopsProcessing ? LogLevel.Fatal : LogLevel.Error, err);
    }

    private class Arg
    {
        [Value(0, MetaName = "pattern", Required = true)]
        public string pattern { get; set; } = null!;

        [Value(1, MetaName = "replacement", Required = false, Default = null)]
        public string? replacement { get; set; }
        [Value(1)]
        public IEnumerable<string> excess { get; set; }

        [Option(shortName: 'o', longName: "options", Separator = ',', Required = false)]
        public IEnumerable<RegexOptions> options { get; set; } = null!;
        [Option(shortName: 's', longName: "split", Required = false, Default = false)]
        public bool split { get; set; }
        [Option(shortName: 'f', longName: "file", Required = false, Default = null)]
        public string? fileOutput { get; set; }
    }
}