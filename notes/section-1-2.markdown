---
layout: default
title: 'Notes on Section 1-2'
---

# Notes on Section 1-2

These are my notes on section 1.2

**Recursion**

Many functions can be defined in terms of themselves. The factorial function is an example:

$$ n! = n \times (n-1)! $$
$$ 0! = 1 $$

It's easy to define a procedure from this definition.

{% highlight scm %}
(define (factorial n)
    (if (= n 0)
        1
        (* n (factorial (- n 1)))))
{% endhighlight %}
The procedure follows directly from the definition of factorial.

**Iteration**

The factorial function can also be calculated iteratively. Calculate it by starting with 1, and multiplying each successive integer until we reach our target. For example.

$$ n! = 1 \times 2 \times 3 \times 4 \times \cdots \times n $$

Translating this to a procedure is often more difficult.

{% highlight scm %}
(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))
{% endhighlight %}

Iterative processes carry all their state with them from one step of the iteration to the next. Every time the procedure 'iter' is called, all the information necessary to evaluate iter is passed on. Compare to the recursive procedure above, where the expression '(* n (factorial (- n 1))' can't be fully evaluated until the the last factorial call reaches the base case of n = 0.

The fact that the Scheme procedure above calls itself doesn't mean that the process is recursive. The key differentiator is whether the procedure call contains all the information it needs to evalute, or whether evaluation is deferred to a future call to the procedure.

**Tree recursion**

The Fibonacci numbers are another function which can be naturally defined recursively

$$ \textrm{Fib}(0) = 0 $$
$$ \textrm{Fib}(1) = 1 $$
$$ \textrm{Fib}(n) = \textrm{Fib} (n-1) + \textrm{Fib}(n-2) $$

The procedure for this is 

{% highlight scm %}
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 0))))))
{% endhighlight %}

Each call to to Fib where n > 1 generates two more calls to Fib. The + operator has to wait for both of those calls to return before it can evaluate its arguments.

The tree recursive definition of this procedure results in a lot of duplicate work. Figure 1.5 on page 38 illustrates that '(fib 3)' is computed twice.

**Orders of Growth**

We're simplifying resources to mean the number of steps taken to solve a given problem, and the amount of space required to solve the problem. 

For the recursive factorial procedure above, as the input grows, the number of steps to solve the problem grows at the same rate. The steps grow as Θ(n).

For the iterative factorial procedure, the steps grow as Θ(n), but the space required to calculate is fully capture by the state variables in each iteration, and never grows. The growth of the space is Θ(1).

The tree-recursive Fibonacci sequence requires $\theta(\phi^{n})$ steps (where φ is the golden ratio) and space Θ(n).

Some problems can be halved. For example, exponentiation. $b^{4}$ can be calculated as:

$$ b \times b \times b \times b \times b \times b \times b \times b $$

but it can also be calculated as

$$ b^{4} \times b^{4} $$

$b^{4}$ can be reduced to

$$ b^{2} \times b^{2} $$

and so on. The steps for calulating exponents this way grow at $\theta(\log n)$.