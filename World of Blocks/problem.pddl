(define (problem p1)
	(:domain world-of-blocks)
	(:objects a b c)
	(:init
		(armempty)
		(clear c)
		(clear b)
		(on-top c a)
		(on-floor b)
		(on-floor a)
	)
	(:goal
		(and
			(armempty)
			(clear a)
			(on-top b c)
			(on-top a b)
			(on-floor c)
		)
	)
)