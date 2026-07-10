rule PHISH_PreconSuite_DeviceCodePhishing_Kit
{
    meta:
        description = "Detects PreconSuite-branded device code phishing kit impersonating SharePoint/Microsoft (Storm-2372-style pattern)"
        author = "Jean-Philippe Thibault"
        date = "2026-07-10"
        reference = "https://github.com/Smartlink2k/threat-research/writeups/2026-07-storm2372-fxsroofing"
        confidence = "high"
        tlp = "clear"

    strings:
        // Branding / lure text — fairly unique combination
        $brand1 = "PreconSuite" ascii wide
        $brand2 = "Document_Review.pdf" ascii wide
        $brand3 = "Requires identity verification" ascii wide
        $brand4 = "Secured by Microsoft" ascii wide

        // Structural JS function names (short, obfuscated, consistent across samples)
        $func1 = "function sf()" ascii
        $func2 = "function ck()" ascii
        $func3 = "function cc()" ascii
        $func4 = "function gm()" ascii
        $func5 = "function se(m)" ascii

        // Backend API endpoint pattern (path structure, not domain-dependent)
        $api1 = "/api/session/init" ascii
        $api2 = "/api/session/status/" ascii

        // Antibot header — name is fixed even though the token value rotates
        $header = "X-Antibot-Token" ascii

        // Device code popup — fixed window dimensions and target
        $popup1 = "microsoft.com/devicelogin" ascii
        $popup2 = "width=500,height=700" ascii nocase
        $popup3 = "'mslogin'" ascii

        // CSS class naming convention (2-letter obfuscated classes, distinctive set)
        $css1 = ".lp-doc" ascii
        $css2 = ".dcs" ascii
        $css3 = "class=\"sc hidden\"" ascii
        $css4 = "class=\"lc hidden\"" ascii
        $css5 = "class=\"ec" ascii

        // Verification code UI copy pattern
        $copy1 = "Copy the code above" ascii
        $copy2 = "Click the button below and paste it" ascii

    condition:
        // Strong match: branding + at least 2 JS functions + the API pattern
        (2 of ($brand*)) and
        (3 of ($func*)) and
        (any of ($api*)) and
        (
            $header or
            (2 of ($popup*)) or
            (3 of ($css*))
        )
}

rule PHISH_DeviceCode_Generic_APIPattern
{
    meta:
        description = "Broader/looser detection for device-code phishing kits sharing the same session-polling API structure, even if rebranded"
        author = "Jean-Philippe Thibault"
        date = "2026-07-10"
        confidence = "medium"
        note = "Higher false-positive risk than the strict rule above; use for hunting, not automatic blocking"

    strings:
        $api1 = "/api/session/init" ascii
        $api2 = "/api/session/status/" ascii
        $popup = "microsoft.com/devicelogin" ascii
        $poll = "setInterval(ck" ascii

    condition:
        2 of them
}
