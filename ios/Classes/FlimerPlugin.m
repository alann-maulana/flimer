#import "FlimerPlugin.h"
#if __has_include(<flimer/flimer-Swift.h>)
#import <flimer/flimer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flimer-Swift.h"
#endif

@implementation FlimerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlimerPlugin registerWithRegistrar:registrar];
}
@end
