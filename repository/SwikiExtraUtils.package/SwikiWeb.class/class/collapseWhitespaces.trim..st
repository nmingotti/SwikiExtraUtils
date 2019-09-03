text-op
collapseWhitespaces: aString trim: aBoolean
	"
	1. replace multiple White Spaces '\s{2,}' to a single SPACE character.
	2. single isolated White Space '\s{1}' are maitained as they are. 
   3. Initial and final whitespaces can be removed sending trim: true.
   4. if trim: true, trimming is perfomed before the space collapsing.

" 
  |str out|
	str := aString copy. 
	aBoolean ifTrue: [ str := str withBlanksTrimmed ].
   out := str copyWithRegex: '\s+' matchesTranslatedUsing: [:match | 
		           (match size = 1) 
			              ifTrue: [ match ] 
			              ifFalse: [ ' ' ]
			      ].
	 ^ out
	
		 