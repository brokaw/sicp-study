---
title: '2.2.3 Sequences as Conventional Interfaces'
layout: notes
category: notes
date: Fri Oct 14 13:51:20 2011
---

# {{ page.title }}

`map` can be combined with other procedures `accumulate` and `filter` to build up a conventional way of dealing with sequenced data. Two examples from the text:

**Example 1** This program takes a tree, goes through it to find all leaves containing an odd number, and squares those odd leaves, and adds the squares together.

{% highlight scm %}
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))
{% endhighlight %}

Program 2 This procedure takes a number n and produces a list of even Fibonacci numbers equal to or less than Fib(n).

{% highlight scm %}
(define (even-fibs n)
  (define (next k)
    (if (> k n)
        nil
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))
{% endhighlight %}

The programs don't seem to have a lot in common, but they can be understood like this:

Program 1
Enumerate tree leaves &rarr; Filter odd leaves &rarr; map square procedure &rarr; Accumulate with +

Program 2
Enumerate integers &rarr; map fib procdure &rarr; filter even results &rarr; accumulate with cons.

Seen this way you can abstact out the notions of filtering and accumulating, and the two actually look very similar.

To filter we can define

{% highlight scm %}
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(filter odd? (list 1 2 3 4 5))
;Value: (1 3 5)

{% endhighlight %}

and to accumulate

{% highlight scm %}

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))
;Value: 15

(accumulate * 1 (list 1 2 3 4 5))
;Value: 120

(accumulate cons nil (list 1 2 3 4 5))
;Value: (1 2 3 4 5)

{% endhighlight %}

We can now define the above procedures in terms of map, filter, and accumulate.

{% highlight scm %}

(define (sum-odd-squares tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                           (enumerate-tree tree)))))

(define (even-fibs n)
  (accumulate cons
              nil
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))
{% endhighlight %}
