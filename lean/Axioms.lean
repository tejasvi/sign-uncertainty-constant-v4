import SignUnc.UpperMainK

/-! Prints the statement of the upper bound and the axioms of the theorems shipped here:
`lake env lean Axioms.lean`.  Each of them depends only on `propext`, `Classical.choice` and `Quot.sound`. -/

#check @SignUnc.upperK
#print SignUnc.UpperStatement
#check @SignUnc.A_pos_classA
#check @SignUnc.A_ft_pos_classA
#check @SignUnc.A_pos_class611
#check @SignUnc.A_ft_pos_class611
#print axioms SignUnc.A_pos_classA
#print axioms SignUnc.A_ft_pos_classA
#print axioms SignUnc.A_pos_class611
#print axioms SignUnc.A_ft_pos_class611
#print axioms SignUnc.upperK
