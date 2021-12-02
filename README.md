# Code Anth

This is the repository for [Code Anth](https://code-anth.herokuapp.com) , which hosts a research project run by Gui Heurich.

The idea of the project is to combine programming and anthropology. If coding is making software and anthropology is researching people, what could the intersection between them be?
That is what we are trying to find out with CodeAnth. Currently, the project is housed at University College London (UCL) and will remain there until at least 2023. 

You are more than welcome to be a part of it.

A list of TODO's is provided below. Please clone and contribute.

# TODO

1. [] Collaborative reading list, where people can upload content
2. [] Design a new favicon
3. [X] ~~Implement a contact form for rubyists~~

# Learning and research group

We currenlty run a reading group on things that intersect technical software material and cultural studies of programming.
We meet every Thursday at 3pm GMT. The readings can be found on [Code Anth](https://code-anth.herokuapp.com).
Please email g.heurich@ucl.ac.uk if you want to join. 

# Contributing

## Preparing the databases

Run
```
bundle install
bundle exec hanami db prepare
```

And then run
```
HANAMI_ENV=test bundle exec hanami db prepare
```
