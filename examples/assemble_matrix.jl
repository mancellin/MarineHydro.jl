using MarineHydro, PyCall

cpt = pyimport("capytaine")
radius = 1.0
resolution = (50, 50)
cptmesh = cpt.mesh_sphere(name="sphere", radius=radius, center=(0, 0, 0), resolution=resolution).immersed_part()
println("$(cptmesh.nb_faces) panels")

mesh = Mesh(cptmesh)

green_functions = (Rankine(), RankineReflected(), GFWu())
assemble_matrices(green_functions, mesh, 1.0)
