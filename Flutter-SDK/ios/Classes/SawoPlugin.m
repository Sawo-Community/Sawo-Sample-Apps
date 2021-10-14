#import "SawoPlugin.h"
#if __has_include(<sawo/sawo-Swift.h>)
#import <sawo/sawo-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sawo-Swift.h"
#endif

@implementation SawoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSawoPlugin registerWithRegistrar:registrar];
}
@end
