---
layout: post
title: "Deconstructing 'e' — What does *e* represent in the formula for the normal distribution?"
date: 2026-05-28 05:20:00 -0700
categories: [mathematical-curiosity]
tags: [statistics, calculus, euler, normal-distribution, foundations]
mathjax: true
---

Before we dive into *e*, let's look at the complete Probability Density Function (PDF) for the normal distribution (the classic bell curve):

$$f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2}$$

In this intimidating-looking formula, *e* represents **Euler's number**, a fundamental mathematical constant approximately equal to 2.71828.

It is the base of the natural logarithm and shows up constantly in mathematics, physics, and engineering whenever you are dealing with continuous growth or continuous decay.

To understand why it is in the normal distribution formula, let's zoom in on the specific part of the equation where it lives:

$$e^{-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2}$$

### How *e* Creates the Bell Curve

The magic of the normal distribution's shape comes entirely from how *e* reacts to that negative, squared exponent.

* **The Peak (Mean):** If your data point ($x$) is exactly equal to the mean ($\mu$), the top part of the fraction becomes 0. The whole exponent becomes 0. Because anything to the power of 0 is 1 ($e^0 = 1$), this gives you the maximum possible height of the curve—the absolute peak of the bell.
* **The Decay (Moving away from the Mean):** As your data point ($x$) moves away from the mean (whether it is higher or lower), the difference ($x-\mu$) gets larger. Because that difference is squared, the exponent always becomes a massive negative number.

In math, a negative exponent means you are dividing (for example, $e^{-2}$ is the exact same as $\frac{1}{e^2}$). So, as you move further from the center, you are raising *e* (2.71828...) to a larger and larger power in the denominator. This causes the value of the function to decay exponentially toward zero, but never quite reach it.

### Why specifically *e* and not 10 or 2?

You could technically draw a bell-shaped curve using 10 or 2 as the base instead of *e*. However, *e* is unique because its rate of change (its derivative) is perfectly proportional to its current value.

When Gauss and Laplace were deriving the mathematics of probability and how random errors cluster around an average, the calculus naturally resolved into *e*. Using *e* makes all the subsequent calculus—like finding the area under the curve (the integral) to get those 68% or 95% probabilities—mathematically elegant and workable.

> **In short:** *e* acts as the engine of exponential decay, perfectly smoothing out the slopes of the bell curve as you move away from the average.

---

## How do you pronounce "Euler"?

It is pronounced **"Oiler"** (rhymes with "boiler").

Even though it looks like it should be pronounced "Yoo-ler" in English, his name is Swiss-German. In German, the "eu" vowel combination makes an "oy" sound. So, whenever you see Euler's number (*e*), Euler's formula, or Eulerian graphs in your math and engineering work, just think of someone who oils machinery!

---

## Where does the exact value 2.71828... come from?

The number *e* wasn't discovered by looking at geometry (like $\pi$ was with circles). It was discovered in 1683 by a mathematician named Jacob Bernoulli who was trying to solve a problem about compound interest.

Imagine you have exactly <span class="tex2jax_ignore">$1.00</span> in a bank account, and the bank offers you an incredibly generous interest rate of 100% per year. How much money will you have at the end of the year? It depends on how often the bank pays you that interest.

* **Yearly (1 time):** At the end of the year, they give you 100% of <span class="tex2jax_ignore">$1</span>. You walk away with <span class="tex2jax_ignore">$2.00</span>.

    $$\left(1 + \frac{1}{1}\right)^1 = 2$$

* **Semi-annually (2 times):** The bank gives you 50% after 6 months (<span class="tex2jax_ignore">$1.50</span>). For the next 6 months, you earn 50% on that new <span class="tex2jax_ignore">$1.50</span>. You walk away with <span class="tex2jax_ignore">$2.25</span>.

    $$\left(1 + \frac{1}{2}\right)^2 = 2.25$$

* **Monthly (12 times):** They give you 1/12 of the interest every month, compounding each time. You walk away with <span class="tex2jax_ignore">$2.61</span>.

    $$\left(1 + \frac{1}{12}\right)^{12} \approx 2.613...$$

* **Daily (365 times):** Compounding every single day yields <span class="tex2jax_ignore">$2.714</span>.

    $$\left(1 + \frac{1}{365}\right)^{365} \approx 2.714...$$

Bernoulli asked: *What if the bank compounded the interest continuously?* Every second, every millisecond, an infinite number of times per year?

You might think infinite compounding would lead to infinite money. But it doesn't. The gains slow down and hit a hard mathematical ceiling. If you compound 100% interest infinitely, the maximum amount of money you can possibly have at the end of the year is exactly <span class="tex2jax_ignore">$2.71828...</span>

That absolute limit to continuous compounding is the definition of *e*:

$$\lim_{n \to \infty} \left(1 + \frac{1}{n}\right)^n = e$$

<p><em>Use the slider below to see this mathematical ceiling in action as you increase the compounding frequency:</em></p>

{% include euler-widget.html %}

---


## Why is *e* associated with continuous growth or decay everywhere?

The reason *e* shows up in biology, physics, finance, and engineering all comes down to one unique, mind-bending property it holds in calculus:

**The function $e^x$ is the ONLY mathematical function in existence where its rate of change (its derivative) is exactly equal to its current value.**

In plain terms: *How fast it is growing is exactly equal to how big it currently is.* Think about how things grow and decay in the real world:

* **Population Growth (Biology):** If you have 100 bacteria, they reproduce at a certain speed. If you have 1,000,000 bacteria, they reproduce much, much faster. The rate of growth depends entirely on the current population.
* **Cooling Coffee (Physics):** If you bring a boiling cup of coffee into a cold room, it loses heat very rapidly at first. As it gets closer to room temperature, the cooling slows down. The rate of cooling (decay) depends entirely on the current temperature difference.
* **Radioactive Decay (Chemistry):** The amount of radiation emitted by uranium depends exactly on how many unstable atoms are currently left in the sample.

Because the universe is filled with systems where the "current state" directly dictates the "speed of change," the mathematics of the universe naturally run on *e*. Whenever you are building a system or an algorithm that models something changing over a continuous flow of time—rather than in chunky, discrete steps—*e* will invariably be the base of the formula because it is the fundamental "speed limit" of continuous change.

---

## The Algebra Trap: Why isn't $(1 + 1/2)^2$ just $1.25$?

When looking at the compound interest formulas above, you might think: *"Hold on... 1 to the power of anything is always 1. So when we do $(1 + 1/2)^2$, why would that be 2.25? Shouldn't it be 1.25 as it will solve to $(1 + 0.25)$?"*

Ah, you have just fallen into one of the most classic algebra traps! You are absolutely right about one thing: 1 to the power of anything is always 1 ($1^2 = 1$, $1^{100} = 1$).

However, in the equation $(1 + 1/2)^2$, we are not raising the number 1 to the power of 2. We are raising the **entire result inside the parentheses** to the power of 2. An exponent does not distribute over addition. In mathematical terms, $(a + b)^2$ is **not** equal to $a^2 + b^2$.

Here are the two correct ways to solve it:

### Method 1: Order of Operations (PEMDAS/BODMAS)
The golden rule of algebra is that you must solve everything inside the parentheses first, before you apply the exponent.

1. Solve inside the parentheses: $1 + 0.5 = 1.5$
2. Apply the exponent to that result: $1.5^2$
3. Calculate: $1.5 \times 1.5 = 2.25$

### Method 2: Algebraic Expansion (FOIL)
If you do want to expand it without combining the inside first, you have to remember that squaring something means multiplying the entire thing by itself:

$$(1 + 0.5)^2 = (1 + 0.5) \times (1 + 0.5)$$

When you multiply that out, you get four separate pieces:

* $1 \times 1 = 1$
* $1 \times 0.5 = 0.5$
* $0.5 \times 1 = 0.5$
* $0.5 \times 0.5 = 0.25$

Add them all together: $1 + 0.5 + 0.5 + 0.25 = \mathbf{2.25}$

So, while $1^2$ is indeed just 1, the extra "interest" components interact with each other to push the total up to 2.25.
