# ESE532 Fall 2020

Sheil Sarda

Taught by Prof. Andre DeHon, TA'ed by Syed Ahmed

## Assignments Overview

### [HW1: Hello AWS, Remember C](https://www.seas.upenn.edu/~ese532/fall2020/handouts/hw1/)

This first assignment is designed to refresh your C knowledge and introduce you to the AWS Cloud which we will be using for the first half of the term.

### [HW2: Profiling](https://www.seas.upenn.edu/~ese532/fall2020/handouts/hw2/)

In this assignment, we will profile an application on an ARM core on AWS (same architecture as we will eventually use on the Zynq MPSoC UltraScale on the Ultra96-v2).

### [HW3: Thread Parallel](https://www.seas.upenn.edu/~ese532/fall2020/handouts/hw3/)

In this assignment, we will map the application from homework 2 on multiple ARM cores of the AWS A1 instance. We will explore different parallel implementations and analyze their impact on performance.

### [HW4: SIMD](https://www.seas.upenn.edu/~ese532/fall2020/handouts/hw4/)

In this assignment, we will accelerate the streaming application from last homework using the ARM NEON vector processor.

### [HW5: Accelerator](https://www.seas.upenn.edu/~ese532/fall2020/handouts/hw5/)

In this assignment, we will accelerate an application by implementing functions on the FPGA on the Amazon F1 Instance.

### [HW6: Accelerator Interface](https://www.seas.upenn.edu/~ese532/fall2020/handouts/hw6/)

In this assignment, we will accelerate an application by implementing functions on the programmable fabric of Ultra96.

Be warned that this homework requires a number of full Vitis builds, each of which can easily take 20–30 minutes, so begin on time and plan your schedule accordingly.

We are delayed in pulling together this assignment and will be releasing it in segments so that you can go ahead and get started on the platform transition (F1 to Ultra96) and first parts of the assignment while we continue to debug and refine the later parts of the assignment.

## Good self driven projects to reinforce course material

From the TA and Professor:

I personally like [this book](https://www.amazon.com/FPGA-Prototyping-SystemVerilog-Examples-MicroBlaze-ebook/dp/B07CW5MSLB). It's based on verilog, so if you want to write C, you'll have to re-write the examples in the book (which is probably a good exercise!). The exercises in the book has nice project ideas.

Also look into the following forums. They have good discussions and what others are doing with the ultra96 board:

- https://www.hackster.io/xilinx/projects
- https://www.element14.com/community/docs/DOC-95649/l/ultra96-v2

And lastly, you can keep up with the latest applications by following the FPGA conferences:

- https://isfpga.org/
- https://www.fccm.org/
- https://www.fpl2020.org/
- http://www.icfpt.org/
- http://tcfpga.org/ keeps track of the field's progress.

The project assignment pointed you at the [Rosetta benchmarks](https://github.com/cornell-zhang/rosetta)

These have original software versions and Cornell's revised version (for SDSoC).

Useful to look at them as examples.  They could be useful to take the original software version as a start and see what you can come up with for a solution.  We have evidence many of those can be done better, so there's also a reasonable goal to try to improve upon Cornell's version (e.g. exploit more parallelism in Rendering).  And, those solutions are SDSoC, so you can also work on what it takes to move them to Vitis.

Generically a SLAM is probably a good task to accelerate.  Trick may be picking the right one. 

Video compression (motion estimation, transforms) is another classic problem that has historically yielded well to spatial parallelism with a large design space to explore.


