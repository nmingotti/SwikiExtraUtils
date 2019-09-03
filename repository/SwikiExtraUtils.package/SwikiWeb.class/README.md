A SwikiWeb is class containing class methods to operate on wiki.squeak.org page. 

NOTE. at the moment the methods jst read from wiki.squeak.org. there is no
possiblity this code will make damages because is never 'saves' in the web page.

------- Example ---------------------

"Get the user-edited version of wiki.squeak.org page. We are interesed only in the <textarea> ... <>.
Returns a big String. "
body := SwikiWeb getPageTextarea: 'http://wiki.squeak.org/squeak/2821.edit' user: 'squeak' pass: 'viewpoints'. 

"Find all the links the 'body' "
SwikiWeb findLinksIn: body. 
"=>  an OrderedCollection('*HaloMorph*' '*Better Debugging*' '*Better   Debugging*' '*Better Debugging*' '*Better Debugging*')"

"Cure all links with multiple spaces in their body."
body2 := SwikiWeb cureBadLinksIn: body. 

"Show the new list of all links in body2, the bad links must appear here as ok-links."
SwikiWeb findLinksIn: body2. 
"=> an OrderedCollection('*HaloMorph*' '*Better Debugging*' '*Better Debugging*' '*Better Debugging*' '*Better Debugging*')
"
------------------------------------------



Instance Variables
