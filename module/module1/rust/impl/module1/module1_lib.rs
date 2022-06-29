#![ cfg_attr( not( feature = "use_std" ), no_std ) ]
#![ doc( html_logo_url = "https://raw.githubusercontent.com/Wandalen/wTools/master/asset/img/logo_v3_trans_square.png" ) ]
#![ doc( html_favicon_url = "https://raw.githubusercontent.com/Wandalen/wTools/alpha/asset/img/logo_v3_trans_square_icon_small_v2.ico" ) ]
#![ doc( html_root_url = "https://docs.rs/module1/latest/module1/" ) ]
#![ warn( rust_2018_idioms ) ]
#![ warn( missing_debug_implementations ) ]
#![ warn( missing_docs ) ]

//!
//! module1
//!

#![ doc = include_str!( concat!( env!( "CARGO_MANIFEST_DIR" ), "/Readme.md" ) ) ]

/// Internal namespace.
pub( crate ) mod private
{
}

/// Protected namespace of the module.
pub mod protected
{
}

// #[ doc( inline ) ]
// pub use protected::*;

/// Parented namespace of the module.
pub mod orphan
{
}

/// Exposed namespace of the module.
pub mod exposed
{
}

/// Namespace of the module to include with `use module::*`.
pub mod prelude
{
}
