# ESE532 Fall 2020

Sheil Sarda

Taught by Prof. Andre DeHon, TA'ed by Syed Ahmed

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


