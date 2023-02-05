## Code to accompany: [*Information exclusion in quantum measurements and uncertainty relations*](https://arxiv.org/abs/2210.00958)
**Shan Huang, Hua-Lei Yin, Zeng-Bing Chen, and Shengjun Wu**

This is a repository for MATLAB code which was written for the e-Print article "Information exclusion in quantum measurements and uncertainty relations. Shan Huang, Hua-Lei Yin, Zeng-Bing Chen, and Shengjun Wu. [arXiv:2210.00958 [quant-ph]](https://arxiv.org/abs/2210.00958)."

- [Inf_Bound_Unitary](https://github.com/HS0Git/Information-exclusion/blob/main/Inf_Bound_Unitary.m) - Computes the sum of information gain over arbitrary many random orthonormal bases (or unitaries) of finite dimensions and makes comparisons with our upper bound given in Eq. (11) of the main text. This code reduires the free MATLAB toolbox [QETLAB](https://qetlab.com/) to generate random unitaries.
- [randombase](https://github.com/HS0Git/Information-exclusion/blob/main/randombase.m)-a function outputs MUBs of dimensions ranging from 2 to 5 and traceless  orthonormal Hermitian operators to generate Hermitian operators.
- [Inf_Bound_MUB](https://github.com/HS0Git/Information-exclusion/blob/main/Inf_Bound_MUB.m)-Computes the sum of information gain over orthonormal bases (or unitaries) in low dimensions and makes comparisons with our upper bound given in Eq. (11) of the main text. The bases are not generated at random, but denpend on a parameter in [randombase](https://github.com/HS0Git/Information-exclusion/blob/main/randombase.m). One can also choose the bases to be MUBs or approximately MUBs.
