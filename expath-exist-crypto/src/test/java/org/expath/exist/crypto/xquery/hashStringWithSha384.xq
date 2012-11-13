xquery version "1.0";

let $script-collection := concat(replace(replace(request:get-effective-uri(), "/(\w)+.xql$", ""), "/rest/db", ""), '/')
, $expected-result :=
	<expected-result>F4CFDSBHm+Bm400bOgH2q2IbIUj8XRUBWf0inx7lrN0T8IHz9scGVmJoGZ2+s1La</expected-result>
, $actual-result :=
	<actual-result>
		{crypto:hash("Short string for tests.", "SHA-384", "SUN")}
	</actual-result>
, $condition := normalize-space($expected-result/text()) = normalize-space($actual-result/text())
	

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