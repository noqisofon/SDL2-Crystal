@[Link("SDL2")]
lib LibSDL2
  enum BlendMode
    BLENDMODE_NONE = 0x00000000 # no blending
    #        dstRGBA = srcRGBA
    BLENDMODE_BLEND = 0x00000001 # alpha blending
    #        dstRGB  = (srcRGB * srcA) + (dstRGB * (1-srcA))
    #        dstA    = srcA + (dstA * (1-srcA))
    BLENDMODE_ADD = 0x00000002 # additive blending
    #        dstRGB  = (srcRGB * srcA) + dstRGB
    #        dstA    = dstA
    BLENDMODE_MOD = 0x00000004 # color modulate
    #        dstRGB  = srcRGB * dstRGB
    #        dstA    = dstA
    BLENDMODE_MUL = 0x00000008 # color multiply
    #        dstRGB  = (srcRGB * dstRGB) + (dstRGB * (1-srcA))
    #        dstA    = (srcA * dstA) + (dstA * (1-srcA))
    BLENDMODE_INVALID = 0x7FFFFFFF

    # Additional custom blend modes can be returned by SDL_ComposeCustomBlendMode()
  end

  enum BlendOperation
    BLENDOPERATION_ADD          = 0x1 # dst + src: supported by all renderers
    BLENDOPERATION_SUBTRACT     = 0x2 # dst - src : supported by D3D9, D3D11, OpenGL, OpenGLES
    BLENDOPERATION_REV_SUBTRACT = 0x3 # src - dst : supported by D3D9, D3D11, OpenGL, OpenGLES
    BLENDOPERATION_MINIMUM      = 0x4 # min(dst, src) : supported by D3D9, D3D11
    BLENDOPERATION_MAXIMUM      = 0x5 # max(dst, src) : supported by D3D9, D3D11
  end

  enum BlendFactor
    BLENDFACTOR_ZERO                = 0x1 # 0, 0, 0, 0
    BLENDFACTOR_ONE                 = 0x2 # 1, 1, 1, 1
    BLENDFACTOR_SRC_COLOR           = 0x3 # srcR, srcG, srcB, srcA
    BLENDFACTOR_ONE_MINUS_SRC_COLOR = 0x4 # 1-srcR, 1-srcG, 1-srcB, 1-srcA
    BLENDFACTOR_SRC_ALPHA           = 0x5 # srcA, srcA, srcA, srcA
    BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 0x6 # 1-srcA, 1-srcA, 1-srcA, 1-srcA
    BLENDFACTOR_DST_COLOR           = 0x7 # dstR, dstG, dstB, dstA
    BLENDFACTOR_ONE_MINUS_DST_COLOR = 0x8 # 1-dstR, 1-dstG, 1-dstB, 1-dstA
    BLENDFACTOR_DST_ALPHA           = 0x9 # dstA, dstA, dstA, dstA
    BLENDFACTOR_ONE_MINUS_DST_ALPHA = 0xA # 1-dstA, 1-dstA, 1-dstA, 1-dstA
  end

  fun compose_custom_blend_mode = SDL_ComposeCustomBlendMode(src_color_factor : BlendFactor,
                                                             dst_color_factor : BlendFactor,
                                                             color_operation : BlendOperation,
                                                             src_alpha_factor : BlendFactor,
                                                             dst_alpha_factor : BlendFactor,
                                                             alpha_operation : BlendOperation) : BlendMode
end
