#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
   
    s.name         = "FishLampOSXPrerelease"
    s.version      = "0.1.0"
    s.summary      = "This is the core functionality of the FishLamp Framework."
    s.homepage     = "http://s.com"
    s.license      = 'MIT'
    s.author       = { "Mike Fullerton" => "hello@fishlamp.com" }
    s.source       = { :git => "https://github.com/fishlamp/FishLampPrerelease.git", :tag => s.version.to_s }

    s.osx.deployment_target = '10.6'
    s.osx.frameworks = 'CoreServices', 'Security', 'SystemConfiguration', 'ApplicationServices', 'Quartz', 'QuartzCore', 'CoreFoundation',  'Foundation'

    s.requires_arc = false
    
	s.dependency 'FishLampCore'

	s.dependency 'FishLampPrerelease/Compatibility'
	s.dependency 'FishLampPrerelease/Geometry'
	s.dependency 'FishLampPrerelease/ColorUtils'

	s.osx.frameworks = 'Cocoa'
	s.osx.resources = ['FishLampOSX/Resources/Images/*.png', 'FishLampOSX/Resources/xib/*']
	
	s.subspec 'Core' do |ss|
		ss.source_files = 'FishLampOSX/Classes/FishLampOSX.h'
	end

	s.subspec 'CommandLineTool' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'
		ss.dependency 'FishLampPrerelease/CommandLineProcessor'
		ss.dependency 'FishLampPrerelease/BundleUtils'

		ss.source_files = 'FishLampOSX/Classes/CommandLineTool/**/*.{h,m}'
	end

	s.subspec 'ModelObjectDocument' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/ModelObjectDocument/**/*.{h,m}'
	end

	s.subspec 'Image' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Image/**/*.{h,m}'
	end

	s.subspec 'GlobalMenu' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/GlobalMenu/**/*.{h,m}'
	end

	s.subspec 'Utils' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.dependency 'FishLampPrerelease/Notifications'

		ss.source_files = 'FishLampOSX/Classes/Utils/**/*.{h,m}'
	end

	# views

	s.subspec 'AnimatedImageView' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.dependency 'FishLampPrerelease/Animation'

		ss.source_files = 'FishLampOSX/Classes/Views/FLAnimatedImageView*.{h,m}'
	end
	
	s.subspec 'ButtonCell' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/FLButtonCell*.{h,m}'
	end

	s.subspec 'ClickableImageView' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/FLClickableImageView*.{h,m}'
	end

	s.subspec 'CustomButton' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/FLCustomButton*.{h,m}'
	end

	s.subspec 'FramedView' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/FLFramedView*.{h,m}'
	end

	s.subspec 'ImagePlaceholderView' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/FLImagePlaceholderView*.{h,m}'
	end

	s.subspec 'LinkTextField' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/FLLinkTextField*.{h,m}'
	end

	s.subspec 'MouseTrackingView' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/FLMouseTrackingView*.{h,m}'
	end

	s.subspec 'SpinningProgressView' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/FLSpinningProgressView*.{h,m}'
	end

	s.subspec 'TextFieldCell' do |ss|
		ss.source_files = 'FishLampOSX/Classes/Views/FLTextFieldCell*.{h,m}'
		ss.dependency 'FishLampOSXPrerelease/Core'		
	end

	s.subspec 'ViewAdditions' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/Views/NSTextView+*.{h,m}', 'FishLampOSX/Classes/Views/NSView+*.{h,m}'
	end

	# view controllers

	s.subspec 'ActivityLogViewController' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.dependency 'FishLampPrerelease/ActivityLog'

		ss.source_files = 'FishLampOSX/Classes/ViewControllers/FLActivityLogViewController*.{h,m}'
	end


	s.subspec 'ErrorWindowController' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.dependency 'FishLampOSXPrerelease/Utils'

		ss.source_files = 'FishLampOSX/Classes/ErrorWindowController/**/*.{h,m}'
		ss.osx.resources = ['FishLampOSX/Classes/ErrorWindowController/**/*.{png,xib}']
	end

	s.subspec 'FileDropTableViewController' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.source_files = 'FishLampOSX/Classes/ViewControllers/FLFileDropTableViewController*.{h,m}'
	end

	s.subspec 'TextViewController' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.dependency 'FishLampOSXPrerelease/ViewAdditions'

		ss.source_files = 'FishLampOSX/Classes/ViewControllers/FLTextViewController*.{h,m}'
	end

	s.subspec 'TextViewLogger' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.dependency 'FishLampOSXPrerelease/ViewAdditions'

		ss.source_files = 'FishLampOSX/Classes/ViewControllers/FLTextViewLogger*.{h,m}'
	end

	s.subspec 'BreadcrumbBarViewController' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.dependency 'FishLampPrerelease/CoreTextUtils'

		ss.source_files = 'FishLampOSX/Classes/ViewControllers/BreadcrumbBarViewController/**/*.{h,m}'
	end

	s.subspec 'Wizard' do |ss|
		ss.dependency 'FishLampOSXPrerelease/Core'		
		ss.dependency 'FishLampPrerelease/Animation'


		# TODO (MWF): decouple this
		ss.dependency 'FishLampPrerelease/Networking/Activity'

		# TODO (MWF): break panels out of here.
		ss.dependency 'FishLampPrerelease/Authentication'
		ss.dependency 'FishLampPrerelease/Keychain'

		ss.dependency 'FishLampOSXPrerelease/ViewAdditions'
		ss.dependency 'FishLampOSXPrerelease/FramedView'
		ss.dependency 'FishLampOSXPrerelease/BreadcrumbBarViewController'

		ss.source_files = 'FishLampOSX/Classes/Wizard/**/*.{h,m}'
		ss.osx.resources = ['FishLampOSX/Classes/Wizard/**/*.{png,xib}']
	end
end


