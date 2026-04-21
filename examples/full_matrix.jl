using BenchmarkTools
using MarineHydro
using StaticArrays
using PyCall

cpt = pyimport("capytaine")
radius = 1.0
resolution = (50, 50)
cptmesh = cpt.mesh_sphere(name="sphere", radius=radius, center=(0, 0, 0), resolution=resolution).immersed_part()
println("$(cptmesh.nb_faces) panels")

# println("WITH STATIC VECTORS")
# mesh = BEM.StaticArraysMesh(cptmesh)
#
# println("Rankine")
# time = @belapsed assemble_matrices($(Rankine(),), $mesh, $1.0)
# println("\tTotal: $(time*1e3) ms")
# println("\tPer coeff: $(time/mesh.nfaces^2*1e9) ns")
#
# println("Wu")
# time = @belapsed assemble_matrices($(GFWu(),), $mesh, $1.0)
# println("\tTotal: $(time*1e3) ms")
# println("\tPer coeff: $(time/mesh.nfaces^2*1e9) ns")
#
# println("Full matrix")
# time = @belapsed assemble_matrices($(Rankine(), RankineReflected(), GFWu()), $mesh, $1.0)
# println("\tTotal: $(time*1e3) ms")
# println("\tPer coeff: $(time/mesh.nfaces^2*1e9) ns")

mesh = Mesh(cptmesh)

println("Rankine")
time = @belapsed assemble_matrices($(Rankine(),), $mesh, $1.0)
println("\tTotal: $(time*1e3) ms")
println("\tPer coeff: $(time/mesh.nfaces^2*1e9) ns")

println("Wu")
time = @belapsed assemble_matrices($(GFWu(),), $mesh, $1.0)
println("\tTotal: $(time*1e3) ms")
println("\tPer coeff: $(time/mesh.nfaces^2*1e9) ns")

println("Full matrix")
time = @belapsed assemble_matrices($(Rankine(), RankineReflected(), GFWu()), $mesh, $1.0)
println("\tTotal: $(time*1e3) ms")
println("\tPer coeff: $(time/mesh.nfaces^2*1e9) ns")


nothing
