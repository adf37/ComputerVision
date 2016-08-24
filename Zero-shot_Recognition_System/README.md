The zero-shot recognition system implemented here resembles the system proposed in Christoph
Lampert et. al.'s paper. It models the probability of a certain object being present in the image
using the probabilities of being present for each of the attributes that the object is known to 
have. 

To implement you must have a copy of the Animals with Attributes dataset found here:
http://people.cs.pitt.edu/~kovashka/cs1699/hw3_files/hw5/

The dataset provides a 50x85 predicate-matrix-binary.txt, the 40 training classes are given in 
trainclasses.txt and the 10 test classes are given in testclasses.txt. 