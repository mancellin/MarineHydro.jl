using MarineHydro
using PyCall
using Test

@testset "Matrix assembly" begin
    mesh = MarineHydro.Mesh(MarineHydro.example_mesh_from_capytaine())
    smesh = MarineHydro.StaticArraysMesh(MarineHydro.example_mesh_from_capytaine())
    greens_functions = (Rankine(), RankineReflected(), GFWu())

    @testset "Matrix shape" begin
        wavenumber = 1.0
        ω = √(wavenumber*9.8)
        dof = [0,0,1]
        S, D = assemble_matrices(greens_functions, mesh, 1.0);
        S_, K = assemble_matrices(greens_functions, mesh, 1.0; direct=false);
        @test size(S) == size(S_) == size(D) == size(K)
        @test S ≈ S_
        @test !(D ≈ K)
    end

    @testset "Kind of mesh" begin
        S, D = assemble_matrices(greens_functions, mesh, 1.0)
        S__, D__ = assemble_matrices(greens_functions, smesh, 1.0)
        @test S ≈ S__
        @test D ≈ D__
    end

    # using CUDA
    # S_gpu, D_gpu = MarineHydro.assemble_matrices_broadcasting(greens_functions, smesh, 1.0; arrtype=CuArray)
    # @test S__ ≈ Array(S_gpu)
    # @test D__ ≈ Array(D_gpu)

end
