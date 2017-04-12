design doc culture:

- Google's design docs
- Clojure's libraries' "rationale" section
- serveit's "Theory of Operation"

Design docs have many purposes:

- They are a thinking tool (lamport: thinking for programmers)
- They are institutional knowledge (why can't we just...)

But most importantly (this is something I realized at Google) *design docs are checklists*.

If you've read The Checklist Manifesto, you'll appreciate the power of that sentiment - well designed checklists are the best tools we have for improving the reliability of systems with humans in the loop.

Even better, they're *self-enforcing* checklists.

Let me explain.

> To think, you have to write. If you're thinking without writing, you only think you're thinking.
-- Leslie Lamport

This doesn't mean that writing implies thinking. Writing *well*, however, does require thinking - in fact, writing well is an excellent forcing function for thinking.

A design doc at Google is usually based off of some template - here's a straw man outline of one:

1. Objective
2. Background
3. Requirements and scale
4. Design Ideas
  - Privacy
  - Security
  - Scale
5. Alternatives Considered

The "design ideas" section of the template varies from document to document, but it's fundamentally a checklist, where each section heading could be formulated as "have you thought about *blank*" and is accompanied by a one or two paragraph prompt filled with examples and clarification about the scope of the section. Filling out each section forces you to write down the implications of your design for privacy, security, scaling, operations, etc. It forces you to consider whether a similar problem has been solved before.
