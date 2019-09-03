getter
getPageTextarea: aStringUrl user: aStringUser pass: aStringPass
"
. Get the text area of a 'wiki.squeak.org' page. 
. ----- Example -----
tmp := SwikiWeb getPageTextarea: 'http://wiki.squeak.org/squeak/2821' 
	user: 'squeak' pass: 'viewpoints'. 
	
tmp 

"
	|wcl tmp body re1 re2 out pos1 pos2|
	wcl := WebClient new. 
	wcl username: aStringUser.
	wcl password: aStringPass.
	"A wiki source page is accessible via the xxxx.edit URL."
	tmp := wcl httpGet: (aStringUrl, '.edit').
	body := tmp content.
		
	"transform < and > to human readable stuff "
	body := body copyReplaceAll:    '&lt;' with:  '<'.
	body := body copyReplaceAll:    '&gt;' with:  '>'.
	
	"this in Perl would be written <textarea(.*?)>(.*)</textarea>
	but this parsery seems not to implement the non-greedy '?' parameter. 
   re := '<textarea[^>]*>(.*)</textarea>' asRegex .
	re search: body.  "
	
	re1 := '<textarea[^>]*>'  asRegex.
	re2 := '</textarea>' asRegex.

	re1 search: body.
	re2 search: body.

	re1 subEnd: 1." #(3643)"
	re2 subBeginning: 1." #(5159)"

	pos1 := ((re1 subEnd: 1) at: 1) + 1. 
	pos2 := ((re2 subBeginning: 1) at: 1) - 1.

  out := body copyFrom: pos1 to: pos2. 

   ^ out 
 

