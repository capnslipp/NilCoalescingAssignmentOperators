Pod::Spec.new do |s|
  s.name = 'NilCoalescingAssignmentOperators'
  s.version = ->{
    Dir.chdir(__dir__) do
      semver_regex = /\d+\.\d+\.\d+(?:-[\w\.]+)?(?:\+[\w\.]+)?/
      return `xcodebuild -showBuildSettings 2>/dev/null`.match(/CURRENT_PROJECT_VERSION = (#{semver_regex})/)[1]
    end
  }.call
  s.summary = 'A Swift µ-Library for ??/= Combo Operators ??= and =??'
  s.description = "A Swift micro-library that provides two nil-coalescing/assignment combo operators: ??= and =??"
  s.homepage = 'https://github.com/capnslipp/NilCoalescingAssignmentOperators'
  s.license = { :type => 'Public Domain', :file => 'LICENSE' }
  s.author = { 'capnslipp' => 'NilCoalescingAssignmentOperators@capnslipp.com' }
  s.source = { :git => 'https://github.com/capnslipp/NilCoalescingAssignmentOperators.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/capnslipp'
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.source_files = 'Sources/**/*'
end
