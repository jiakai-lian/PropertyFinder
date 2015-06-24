
//
//  PropertyFinder.m
//
//  @version 0.0.1
//  @author Jiakai Lian (jiakai.lian@gmail.com)
//

/*
 
 Copyright (c) 2015 Jiakai Lian <jiakai.lian@gmail.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 The implementation is inspired by JSONModel lib's implementation (https://github.com/icanzilb/JSONModel)
 
 */

#import "PropertyFinder.h"
#import <objc/runtime.h>

@implementation PropertyFinder

/**
 *  find the first property name which support a given protocol
 *  inspired by json model
 *  this method assume only one property will be annotated by the given protocol
 *
 *  @param type               class type
 *  @param targetProtocol target protocol @protocol(Protocol)
 *
 *  @return property name string
 */
+ (NSString *)findFisrtProperty:(Class)type confirmToProtocol:(Protocol *)targetProtocol
{
    NSScanner *scanner = nil;
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList(type, &propertyCount);
    NSString *targetProtocolName = NSStringFromProtocol(targetProtocol);
    
    //loop over the class properties
    for (unsigned int i = 0; i < propertyCount; i++)
    {
        //get property name
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        
        //get property attributes
        const char *attrs = property_getAttributes(property);
        NSString *propertyAttributes = @(attrs);
        
        scanner = [NSScanner scannerWithString:propertyAttributes];
        [scanner scanUpToString:@"<" intoString:nil];
        
        while ([scanner scanString:@"<" intoString:NULL])
        {
            
            NSString *protocolName = nil;
            
            [scanner scanUpToString:@">" intoString:&protocolName];
            
            if ([protocolName isEqualToString:targetProtocolName])
            {
                return [[NSString alloc] initWithUTF8String:propertyName];
            }
            [scanner scanString:@">" intoString:NULL];
        }
    }
    
    return nil;
    
}

@end
