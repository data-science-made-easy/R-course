# The idea behind recursion

In computer science, a methods or function exhibits recursive behaviour when they can be defined by two properties: \(1\) a simple _base case_ with a terminating scenario that does not use recursion to produce an answer. \(2\) A set of rules that reduce all other cases toward the base case \(_recursion_\).

For example, the following is a recursive definition of a person's ancestors:  
_Base case:_ one's parents are one's ancestors.  
_Recursion step:_ the ancestors of one's ancestors are also one's ancestors.

Another example is a recursive definition of natural numbers:  
_Base case:_ `0` is a natural number.  
_Recursion step:_ if `n` is a natural number, then `n + 1` is a natural number.

![Another example is visual recursion, also so-called the Droste-effect. Here an image contains a smaller version of itself.](.gitbook/assets/droste_cacao_100gr_blikje-_foto_02.jpg)

The exercises on the following pages are examples of cases in which a recursive approach simplifies solving a computational task.

