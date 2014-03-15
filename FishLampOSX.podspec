Pod::Spec.new do |s|
   
    s.name         = "FishLampOSX"
    s.version      = "0.0.2"
    s.summary      = "This is the core functionality of the FishLamp Framework."
    s.homepage     = "http://s.com"
    s.license      = 'MIT'
    s.author       = { "Mike Fullerton" => "hello@fishlamp.com" }
    s.source       = { :git => "https://github.com/fishlamp/FishLampPrerelease.git", :tag => s.version.to_s }

    s.osx.deployment_target = '10.6'
    s.osx.frameworks = 'CoreServices', 'Security', 'SystemConfiguration', 'ApplicationServices', 'Quartz', 'QuartzCore', 'CoreFoundation',  'Foundation'

    s.requires_arc = false
    
	s.dependency 'FishLamp/Core'

	s.dependency 'FishLampUI/Compatibility'
	s.dependency 'FishLampUI/Geometry'
	s.dependency 'FishLampUI/ColorUtils'

	s.osx.frameworks = 'Cocoa'
	s.osx.resources = ['Resources/Images/*.png', 'Resources/xib/*']
	
	s.source_files = 'Classes/*.h'

	s.default_subspec = 'All'

	s.subspec 'CommandLineTool' do |ss|
		ss.dependency 'FishLamp/CommandLineProcessor'
		ss.dependency 'FishLamp/BundleUtils'
		ss.source_files = 'Classes/CommandLineTool/**/*.{h,m}'
	end

	s.subspec 'Documents' do |ss|
		ss.source_files = 'Classes/Documents/**/*.{h,m}'
	end
	
	s.subspec 'Menus' do |ss|
		ss.source_files = 'Classes/Menus/**/*.{h,m}'
	end

	s.subspec 'Utils' do |ss|
		ss.dependency 'FishLamp/CommandLineProcessor'
	
		ss.source_files = 'Classes/Utils/**/*.{h,m}'
	end

	# views

	s.subspec 'Views' do |views|
		views.subspec 'AnimatedImageView' do |ss|
			ss.dependency 'FishLampUI/Animation'
			ss.source_files = 'Classes/Views/FLAnimatedImageView*.{h,m}'
		end
	
		views.subspec 'ButtonCell' do |ss|
			ss.source_files = 'Classes/Views/FLButtonCell*.{h,m}'
		end

		views.subspec 'ClickableImageView' do |ss|
			ss.source_files = 'Classes/Views/FLClickableImageView*.{h,m}'
		end

		views.subspec 'CustomButton' do |ss|
			ss.source_files = 'Classes/Views/FLCustomButton*.{h,m}'
		end

		views.subspec 'FramedView' do |ss|
			ss.source_files = 'Classes/Views/FLFramedView*.{h,m}'
		end

		views.subspec 'ImagePlaceholderView' do |ss|
			ss.source_files = 'Classes/Views/FLImagePlaceholderView*.{h,m}'
		end

		views.subspec 'LinkTextField' do |ss|
			ss.source_files = 'Classes/Views/FLLinkTextField*.{h,m}'
		end

		views.subspec 'MouseTrackingView' do |ss|
			ss.source_files = 'Classes/Views/FLMouseTrackingView*.{h,m}'
		end

		views.subspec 'SpinningProgressView' do |ss|
			ss.source_files = 'Classes/Views/FLSpinningProgressView*.{h,m}'
		end

		views.subspec 'TextFieldCell' do |ss|
			ss.source_files = 'Classes/Views/FLTextFieldCell*.{h,m}'
		end
	end

	s.subspec 'ViewControllers' do |vc|
		vc.subspec 'ActivityLogViewController' do |ss|
			ss.dependency 'FishLampUI/ActivityLog'
			ss.source_files = 'Classes/ViewControllers/FLActivityLogViewController*.{h,m}'
		end

		vc.subspec 'FileDropTableViewController' do |ss|
			ss.source_files = 'Classes/ViewControllers/FLFileDropTableViewController*.{h,m}'
		end

		vc.subspec 'TextViewController' do |ss|
			ss.dependency 'FishLampOSX/Utils'
			ss.source_files = 'Classes/ViewControllers/FLTextViewController*.{h,m}'
		end

		vc.subspec 'TextViewLogger' do |ss|
			ss.dependency 'FishLampOSX/Utils'
			ss.source_files = 'Classes/ViewControllers/FLTextViewLogger*.{h,m}'
		end

		vc.subspec 'ErrorSheet' do |ss|
			ss.dependency 'FishLampOSX/Utils'
			ss.dependency 'FishLampUI/Notifications'
			ss.source_files = 'Classes/ViewControllers/NSViewController+FLErrorSheet*.{h,m}'
		end

		vc.subspec 'BreadcrumbBarViewController' do |ss|
			ss.dependency 'FishLampUI/CoreTextUtils'
			ss.source_files = 'Classes/ViewControllers/BreadcrumbBarViewController/**/*.{h,m}'
		end
	end
	
	s.subspec 'Windows' do |windows|
		windows.subspec 'ErrorWindowController' do |ss|
			ss.dependency 'FishLampOSX/Utils'
			ss.source_files = 'Classes/Windows/ErrorWindowController/**/*.{h,m}'
			ss.osx.resources = ['Classes/Windows/ErrorWindowController/**/*.{png,xib}']
		end

		windows.subspec 'ModalWindow' do |ss|
			ss.source_files = 'Classes/Windows/NSWindowController+FLModalAdditions*.{h,m}'
		end
	end
	
	s.subspec 'Wizard' do |ss|
		ss.dependency 'FishLampUI/Animation'
		ss.dependency 'FishLamp/Containers'

		# TODO (MWF): decouple this
		ss.dependency 'FishLamp/Networking/Activity'

		# TODO (MWF): break panels out of here.
		ss.dependency 'FishLamp/Networking/Authentication'
		ss.dependency 'FishLamp/Keychain'

		ss.dependency 'FishLampOSX/Utils'
		ss.dependency 'FishLampOSX/Views/FramedView'
		ss.dependency 'FishLampOSX/ViewControllers/BreadcrumbBarViewController'

		ss.source_files = 'Classes/Wizard/**/*.{h,m}'
		ss.osx.resources = ['Classes/Wizard/**/*.{png,xib}']
	end

	s.subspec 'All' do |ss|
		ss.dependency 'FishLampOSX/Documents'
		ss.dependency 'FishLampOSX/Menus'
		ss.dependency 'FishLampOSX/Utils'
		ss.dependency 'FishLampOSX/Views'
		ss.dependency 'FishLampOSX/ViewControllers'
		ss.dependency 'FishLampOSX/Windows'

		ss.dependency 'FishLampOSX/Wizard'
        
	end


    



    s.xcconfig = {
        "CLANG_ANALYZER_DEADCODE_DEADSTORES" => "YES",
        "CLANG_ANALYZER_GCD" => "YES",
        "CLANG_ANALYZER_MALLOC" => "YES",
        "CLANG_ANALYZER_MEMORY_MANAGEMENT" => "YES",
        "CLANG_ANALYZER_OBJC_ATSYNC" => "YES",
        "CLANG_ANALYZER_OBJC_CFNUMBER" => "YES",
        "CLANG_ANALYZER_OBJC_COLLECTIONS" => "YES",
        "CLANG_ANALYZER_OBJC_INCOMP_METHOD_TYPES" => "YES",
        "CLANG_ANALYZER_OBJC_NSCFERROR" => "YES",
        "CLANG_ANALYZER_OBJC_RETAIN_COUNT" => "YES",
        "CLANG_ANALYZER_OBJC_SELF_INIT" => "YES",
        "CLANG_ANALYZER_OBJC_UNUSED_IVARS" => "YES",
        "CLANG_ANALYZER_SECURITY_INSECUREAPI_GETPW_GETS" => "YES",
        "CLANG_ANALYZER_SECURITY_INSECUREAPI_MKSTEMP" => "YES",
        "CLANG_ANALYZER_SECURITY_INSECUREAPI_STRCPY" => "YES",
        "CLANG_ANALYZER_SECURITY_INSECUREAPI_UNCHECKEDRETURN" => "YES",
        "CLANG_ANALYZER_SECURITY_INSECUREAPI_VFORK" => "YES",
        "CLANG_ANALYZER_SECURITY_KEYCHAIN_API" => "YES",
        "CLANG_WARN_BOOL_CONVERSION" => "YES",
        "CLANG_WARN_CONSTANT_CONVERSION" => "YES",
        "CLANG_WARN_CXX0X_EXTENSIONS" => "YES",
        "CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS" => "YES",
        "CLANG_WARN_DIRECT_OBJC_ISA_USAGE" => "YES_ERROR",
        "CLANG_WARN_EMPTY_BODY" => "YES",
        "CLANG_WARN_OBJCPP_ARC_ABI" => "YES",
        "CLANG_WARN_OBJC_MISSING_PROPERTY_SYNTHESIS" => "YES",
        "CLANG_WARN_OBJC_RECEIVER_WEAK" => "YES",
        "CLANG_WARN_OBJC_ROOT_CLASS" => "YES",
        "CLANG_WARN__ARC_BRIDGE_CAST_NONARC" => "YES",
        "CLANG_WARN__DUPLICATE_METHOD_MATCH" => "YES",
        "GCC_WARN_64_TO_32_BIT_CONVERSION" => "YES",
        "GCC_WARN_64_TO_32_BIT_CONVERSION" => "YES",
        "GCC_WARN_ABOUT_DEPRECATED_FUNCTIONS" => "YES",
        "GCC_WARN_ABOUT_INVALID_OFFSETOF_MACRO" => "YES",
        "GCC_WARN_ABOUT_MISSING_FIELD_INITIALIZERS" => "YES",
        "GCC_WARN_ABOUT_MISSING_PROTOTYPES" => "YES",
        "GCC_WARN_ABOUT_POINTER_SIGNEDNESS" => "YES",
        "GCC_WARN_ABOUT_RETURN_TYPE" => "YES",
        "GCC_WARN_ALLOW_INCOMPLETE_PROTOCOL" => "YES",
        "GCC_WARN_CHECK_SWITCH_STATEMENTS" => "YES",
        "GCC_WARN_INITIALIZER_NOT_FULLY_BRACKETED" => "YES",
        "GCC_WARN_MISSING_PARENTHESES" => "YES",
        "GCC_WARN_SHADOW" => "YES",
        "GCC_WARN_TYPECHECK_CALLS_TO_PRINTF" => "YES",
        "GCC_WARN_UNDECLARED_SELECTOR" => "YES",
        "GCC_WARN_UNINITIALIZED_AUTOS" => "YES",
        "GCC_WARN_UNUSED_LABEL" => "YES",
        "GCC_WARN_UNUSED_VALUE" => "YES",
        "GCC_WARN_UNUSED_VARIABLE" => "YES",
        "CLANG_ANALYZER_SECURITY_INSECUREAPI_RAND" => "NO",
        "CLANG_WARN__EXIT_TIME_DESTRUCTORS" => "NO",
        "CLANG_WARN_IMPLICIT_SIGN_CONVERSION" => "NO",
        "CLANG_WARN_SUSPICIOUS_IMPLICIT_CONVERSION" => "NO",
        "CLANG_WARN_OBJC_IMPLICIT_ATOMIC_PROPERTIES" => "NO",
        "CLANG_ANALYZER_SECURITY_FLOATLOOPCOUNTER" => "NO",
        "GCC_WARN_ABOUT_MISSING_NEWLINE" => "NO",
        "GCC_TREAT_INCOMPATIBLE_POINTER_TYPE_WARNINGS_AS_ERRORS" => "NO",
        "GCC_WARN_UNKNOWN_PRAGMAS" => "NO",
        "GCC_WARN_FOUR_CHARACTER_CONSTANTS" => "NO",
        "GCC_WARN_HIDDEN_VIRTUAL_FUNCTIONS" => "NO",
        "GCC_WARN_INHIBIT_ALL_WARNINGS" => "NO",
        "GCC_WARN_UNUSED_FUNCTION" => "NO",
        "GCC_WARN_UNUSED_PARAMETER" => "NO",
        "GCC_WARN_MULTIPLE_DEFINITION_TYPES_FOR_SELECTOR" => "NO",
        "GCC_WARN_NON_VIRTUAL_DESTRUCTOR" => "NO",
        "GCC_WARN_PEDANTIC" => "NO",
        "GCC_WARN_SIGN_COMPARE" => "NO",
        "GCC_WARN_STRICT_SELECTOR_MATCH" => "NO",
        "GCC_TREAT_WARNINGS_AS_ERRORS" => "YES"
    }

    s.compiler_flags = '-Werror', '-Waddress', '-Warray-bounds', '-Wc++11-compat', '-Wchar-subscripts', '-Wimplicit-function-declaration', '-Wcomment', '-Wformat', '-Wmain ', '-Wmissing-braces', '-Wnonnull', '-Wparentheses', '-Wpointer-sign', '-Wreorder', '-Wreturn-type', '-Wsequence-point', '-Wsign-compare', '-Wswitch', '-Wtrigraphs'

end
