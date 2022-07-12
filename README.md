The file "eqn_annotate.tex" is the main latex file.

This repository provides four examples of annotated equations:

1. [example_prob.tex] A simple one inside the equation construct, in a double column format
2. [example_prob2.tex] A more complex one, but this time inside the figure construct in a double column format
3. [example_laplace.tex] Inside the wrapfigure construct but for a single column format
4. [example_overlay.tex] More complicated examples, side-by-side using the minipage construct in a single column format

The folder, "example_output_figs" includes figures that show the outputs of the above four cases.

Note: the main latex file, "eqn_annotate.tex" includes many latex packages and some definitions that are required.

To build all the examples into a single file, type:
> make

OR 

> pdflatex (or xelatex) eqn_annotate

The output PDF file (containing all the examples) is named: eqn_annotate.pdf

**Update**: There is now a [Latex package](https://github.com/st--/annotate-equations) that makes it easier to create annotated equations! Check it out. They have even [created a demo file that uses the same examples as mine](https://github.com/st--/annotate-equations/blob/main/examples/sibin_demo.tex).

Link to the [CTAN package](https://ctan.org/pkg/annotate-equations) page.


# Examples #

* [example_prob.tex] A simple one inside the equation construct, in a double column format

![example_prob.tex output](/example_output_figs/example_prob.png)

* [example_prob2.tex] A more complex one, but this time inside the figure construct in a double column format

![example_prob2.tex output](/example_output_figs/example_prob2.png)

* [example_laplace.tex] Inside the wrapfigure construct but for a single column format

![example_laplace.tex output](example_output_figs/example_laplace.png)

* [example_overlay.tex] More complicated examples, side-by-side using the minipage construct in a single column format

![example_overlay.tex output](/example_output_figs/example_overlay.png)


