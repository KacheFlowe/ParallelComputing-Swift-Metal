//
//  Shaders.metal
//  ParallelDP
//
//  Created by Jiheng Zhang on 1/1/2016.
//  Copyright © 2016 verse. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

kernel void sigmoid(const device float *inVector [[ buffer(0) ]],
                    device float *outVector [[ buffer(1) ]],
                    uint id [[ thread_position_in_grid ]],
                    uint i [[thread_position_in_threadgroup]],
                    uint w [[threadgroup_position_in_grid]],
                    uint S [[threads_per_threadgroup]]) {
    // This calculates sigmoid for _one_ position (=id) in a vector per call on the GPU
    // outVector[id] = 1.0 / (1.0 + inVector[id]);
    if (id != w*S+i)
        outVector[id]=1;
    else
        outVector[id]=0;
}
