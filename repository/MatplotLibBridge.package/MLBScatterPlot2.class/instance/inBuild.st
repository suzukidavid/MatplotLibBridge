building
inBuild
	((self data groupedBy: #marker) associations
		sorted: [ :a :b | 
			(self markersOrder indexOf: a head) < (self markersOrder indexOf: b head) ])
		do: [ :assoc |
		|marker scatterData|
		marker := assoc head.
		scatterData := assoc tail.
		self commandList
		add:
			(MLBScatterCommand new
				x: (scatterData collect: #x);
				y: (scatterData collect: #y);
				s: (scatterData collect: #size);
				c: (scatterData collect: #color);
				marker: marker;
				yourself) ]