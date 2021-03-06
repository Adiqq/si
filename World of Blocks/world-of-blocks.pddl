(define
	(domain world-of-blocks)
	(:requirements :adl)
	(:predicates
		(on-top ?x ?y)
		(on-floor ?x)
		(clear ?x)
		(armempty)
		(holding ?x)
	)
	; kladziemy x na y
	(:action stack
		:parameters (?x ?y)
		:precondition
		(and
			(holding ?x)
			(clear ?y)
		)
		:effect
		(and
			(on-top ?x ?y)
			(not (holding ?x))
			(armempty)
			(not (clear ?y))
		)
	)
	; zdejmuejmy x z y
	(:action unstack
		:parameters (?x ?y)
		:precondition
		(and
			(armempty)
			(on-top ?x ?y)
			(clear ?x)
		)
		:effect
		(and
			(holding ?x)
			(not (armempty))
			(not (on-top ?y ?x))
			(clear ?y)
		)
	)
	; kladziemy x na podloze
	(:action putdown
		:parameters (?x)
		:precondition
		(and
			(holding ?x)
		)
		:effect
		(and
			(armempty)
			(not (holding ?x))
			(on-floor ?x)
		)
	)
	; podnosimy x z podloza
	(:action pickup
		:parameters (?x)
		:precondition
		(and
			(armempty)
			(on-floor ?x)
			(clear ?x)
		)
		:effect
		(and
			(not (armempty))
			(holding ?x)
			(not (on-floor ?x))
		)
	)
)