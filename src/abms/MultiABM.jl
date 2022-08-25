"""
    A concept for multi ABMs for orchestering a set of 
        elemantary ABMs.

    This file is included in the module MultiABMs. 
""" 

export AbstractMABM, MultiABM 
export dummyinit

abstract type AbstractMABM  end   # <: AbstractABM (to think about it)

dummyinit(mabm::AbstractMABM) = nothing 

"A MultiABM concept" 
mutable struct MultiABM   <: AbstractMABM 
    abms::Array{AbstractABM,1} 

    "Dictionary of model properties"
    properties

    """
    Cor expecting a declaration function that declares 
        a list of elemantary ABMs together with
        MABM-level properties  
    """  
    function MultiABM(properties = Dict{Symbol,Any}(); 
                    initialize::Function = dummyinit,  
                    declare::Function) 
        mabm = new(declare(properties),deepcopy(properties))
        initialize(mabm) 
        mabm
    end 

end # MultiABM  



