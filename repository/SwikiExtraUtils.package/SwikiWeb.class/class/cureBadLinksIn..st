text-op
cureBadLinksIn: aString
	"Returns a copy of aString where all 'bad-links', that is links with multiple
	whitespaces have been corrected to be links with non adjacent whitespaces.
	
	String that represent a regexp matching:   *fooo bar baz* or *alfa !@3 gamma* "
	
	|reStr out|
	
	reStr := '\*[^\*]+\*'.
	
	out := aString copyWithRegex: reStr matchesTranslatedUsing: [:each | 
			SwikiWeb collapseWhitespaces: each  trim: true.  
		].
	
	^ out
	
	
	 
	 