#if TEST
using System.Diagnostics.CodeAnalysis;
using System.Text.RegularExpressions;
using NUnit.Framework;

namespace rgx;

public static class Tests
{
    public enum RunType
    {
        match,
        expand,
        split,
        cut
    }

    public static string[] Run(RunType type, [StringSyntax(StringSyntaxAttribute.Regex)] string pattern, params string[] input)
    {
        var @in = new StringReader(string.Join("\n", input));
        var @out = new StringWriter();

        Run(type, pattern, @in, @out);
        return Regex.Split(@out.ToString(), "\r?\n").SkipLast(1).ToArray();
    }

    public static void Run(RunType type, string pattern, TextReader input, TextWriter output)
    {
        var bakIn = Console.In;
        var bakOut = Console.Out;

        try
        {
            Console.SetIn(input);
            Console.SetOut(output);

            RGX.Exec(type.ToString(), pattern);
        }
        finally
        {
            Console.SetIn(bakIn);
            Console.SetOut(bakOut);
        }
    }

    [Test]
    public static void ScreenExample()
    {
        const string input =
            @"There are screens on:
        467698.voip     (Detached)
        467687.voip     (Detached)
        468266.yourprocess      (Detached)
        467676.gameserver       (Detached)
        467665.gameserver       (Detached)
        467654.gameserver       (Detached)
        467643.gameserver       (Detached)
7 Sockets in /run/screens/S-kaleidox.";
        var result = Run(RunType.match, @"\s*(\d+)\.(yourprocess)\s+\((\w+)\)", input);

        Assert.That(result.Length, Is.EqualTo(1));
        Assert.That(result[0], Is.EqualTo(Regex.Split(input, "\r?\n")[3]));
    }

    [Test]
    public static void SimpleArrayParse()
    {
        var result = Run(RunType.split, @"[\[\"",\s\]]+", @"[ 0,1, 2 ,3, 4] ");
        for (var i = 0; i < result.Length; i++)
            Assert.That(int.Parse(result[i]), Is.EqualTo(i));
    }
}
#endif