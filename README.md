# mc_pi

This webapp demonstrates the use of Monte Carlo simulation to estimate the true value of pi. The inner circle has radius 1 and area pi, and the outer square has area 4. We then generate random samples from the uniform distribution between -1 and 1 for both x and y, and find the proportion of samples that fall within the circle. Since this proportion should be close to the ratio of the area of the circle to the square, we can multiply the sample proportion by 4 to get an estimate of pi.

To run in R, install the Shiny package then run the following code:

>shiny::runGitHub("mc_pi", "benmwhite")

