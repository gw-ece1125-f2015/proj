# Project - BFF Book - Part 1

Assigned: November 20th, 2015.

Due: Monday, November 30th, 2015 11:59:59 PM.

# Introduction
BFF book is the hotest social networking app. Ever. You form BFF (best friend fornow) connections with other users and there a ranked popularity list that sorts users based on the number of bffs each has. You have been hired to write the software to make the BFF application work.
(Later on, we will add a fine-grained privacy model where the amount of your information visible to another user depends on the number of bff connections between you and the other user.)


Your job is complicated because bff connections can be constantly created or destroyed and this affects the ranked popularity list. You must check the permissions for parts of a profile (name, list of bffs, summary, full-profile) private based on the bff distance between two users.

# Command-line Arguments
Your program should be invoked like this example:
```
./bffbook input_file.txt [max-users]

The command-line arguments are:
argv[0]: bffbok
argv[1]: input_file.txt – The input file specifying bff events
argv[2]: The maxiumum number of BFF Book users, defaults to 1000.
```

# Input File Format
Each line in an input file to your program is a comma-separated record of bff events.

More formally, each input line is one of the following commands:

create_user user-id, name, summary-text, full-profile text
delete_user user-id
bff userid_from, userid_to
unbff userid_from, userid_to
read userid_reader, userid_target, piece-of-info
rank

Create user creates a user with a given id, parts of the profile, and the id of the new user's first bff (-1 means none). Userids are integers from the input file that are smaller than the maximum number of users.

The ``bff`` command creates a new bff connection between two users and
the ``unbff`` command removes a connection between two users. The edge
matrix, and popularity tree must be updated to reflect the changes
after these actions. (Later on, we will incorporate a distance matrix
to trace the distance between users.)

The read command just attempts to read part of another user's profile
to another user. The rank command prints out a list of users ranked by
the number of BFFs.

All other lines are ignored.

# Data Structures
Although our version uses binary search trees, you are free to use
your own data structures to implement BFF book, but inefficient data
structures and brute-force solutions will receive a low score. If you
are unsure, discuss with the instructor.

Unlike your previous versions of a binary search tree, your code must
support deletions. In order to make this feasible, you must add parent
pointers into your tree nodes, in addition to the left and right child
pointers:

```
struct tree_node {
	tree_data_t data;
	struct tree_node *left;
	struct tree_node *right;
	struct tree_node *parent;
};
```

We have provided you a tree_validate function to help you verify the
correctness of your implementation.

You will also have to write your own cmp function to compare two
users, first by bff count, and if there is a tie, then by userid.

We recommend that you use a 2D matrix for the BFF edges between users and the distance between all users. We have provided functions to help you print out matrices to make debugging easier.

Every time you add or remove a bff, you have to update these
matrices. In particular, adding an edge and recomputing all distances
can be done faster than removing an edge and recomputing. This is why
there are two functions for these operations. 

# Example Code
You will be provided some helpful skeleton code to get started. This
includes prototypes for the needed data structures, function
prototypes, and a sketch of what algorithms you have to apply to the
input data.
