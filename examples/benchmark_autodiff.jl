
element_1 = (center=[0.0, 0.0, -1.0],)
element_2 = (
    center=[1.0, 1.0, -2.0],
    vertices= [-0.5 -0.5 0.0; 0.5 -0.5 0.0; 0.5 0.5 0.0; -0.5 0.5 0.0] .+ [1.0, 1.0, -2.0]',
    normal=[0.0, 0.0, 1.0],
    radius=sqrt(2)/2,
    area=1.0,
)

# println("Gradients")
# println(" Rankine")
# S(z) = MarineHydro.integral(Rankine(), (center=[0.0, 0.0, z],), element_2)
# DS(z) = Zygote.gradient(S, z)
# @btime $DS($(-1.0))
# D(z) = MarineHydro.integral_gradient(Rankine(), (center=[0.0, 0.0, z],), element_2)
# @btime Zygote.jacobian($D, $(-1.0))
#
# println(" GFWu")
# S(z) = real(MarineHydro.integral(GFWu(), (center=[0.0, 0.0, z],), element_2, wavenumber))
# @btime Zygote.gradient($S, $(-1.0))
# D(z) = real.(MarineHydro.integral_gradient(GFWu(), (center=[0.0, 0.0, z],), element_2, wavenumber))
# @btime Zygote.jacobian($D, $(-1.0))

#=println(" ExactDelhommeau")=#
#=S(z) = real(MarineHydro.integral(ExactGuevelDelhommeau(), (center=[0.0, 0.0, z],), element_2, wavenumber))=#
#=@btime Zygote.gradient($S, $(-1.0))=#
#=D(z) = real.(MarineHydro.integral_gradient(ExactGuevelDelhommeau(), (center=[0.0, 0.0, z],), element_2, wavenumber))=#
#=@btime Zygote.jacobian($D, $(-1.0))=#
