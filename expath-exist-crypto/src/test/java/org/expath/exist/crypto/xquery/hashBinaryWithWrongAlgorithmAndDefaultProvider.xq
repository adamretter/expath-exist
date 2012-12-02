xquery version "1.0";

let $input := util:binary-doc(concat('xmldb:', resolve-uri('../resources/keystore', concat(substring-after(system:get-module-load-path(), 'xmldb:'), '/'))))
let $expected-result :=
	<expected-result>err:CX21: The algorithm is not supported.</expected-result>
let $actual-result :=
	<actual-result>
        {
            util:catch(
            "java.lang.Exception",
            crypto:hash($input, "SHA-17", ()),
            <error>{$util:exception-message}</error>
            )               
        }	
	</actual-result>
let $condition := contains(normalize-space($actual-result/error/text()), normalize-space($expected-result/text()))
	

return
	<result>
		{
		(
		if ($condition)
			then <result-token>passed</result-token>
			else <result-token>failed</result-token>
		, $actual-result
		)
		}
	</result>