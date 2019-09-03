text-op
findLinksIn: aString
	"Returns a list of all links (as defined in wiki.squeak.org) in the string aString."
	|re|
	re := '\*[^\*]+\*' asRegex .
	^ re matchesIn: aString.
	  