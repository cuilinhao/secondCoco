////
////  TNTestLab.m
////  tttest
////
////  Created by 崔林豪 on 2018/1/17.
////  Copyright © 2018年 cuilinhao. All rights reserved.
////
//
//#import "TNTestLab.h"
//#import <CoreText/CoreText.h>
//
//
//@implementation TNTestLab
//
///*
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}
//*/
//
//- (void)drawTextInRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(context);
//    //将当前context的坐标系进行flip,否则上下颠倒
//    CGAffineTransform flipVertical = CGAffineTransformMake(1,0,0,-1,0,self.bounds.size.height);
//    CGContextConcatCTM(context, flipVertical);
//    //设置字形变换矩阵为CGAffineTransformIdentity，也就是说每一个字形都不做图形变换
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    NSString *attrStr = self.resultAttributedString.string;
//    NSRange range = NSMakeRange(0, attrStr.length);
//    NSDictionary *dic = [self.resultAttributedString attributesAtIndex:0 effectiveRange:&range];
//    NSMutableParagraphStyle *ps =  [dic objectForKey:NSParagraphStyleAttributeName];
//    BOOL truncatTail = NO;
//    if(ps.lineBreakMode == NSLineBreakByTruncatingTail)
//    {
//        truncatTail = YES;
//    }
//
//    CTFramesetterRef framesetter = [self framesetter];
//    CGMutablePathRef pathRef = CGPathCreateMutable();
//    CGPathAddRect(pathRef,NULL , CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
//    _textFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), pathRef,NULL );
//    NSInteger numberOfLines = [self numberOfDisplayedLines];
//
//    CGSize tempSize = self.frame.size;
//    CGSize trueSize = [self getLLLLabelSize];
//
//    if (_textFrame)
//    {
//        if (numberOfLines > 0 && tempSize.height < trueSize.height)
//        {
//            CFArrayRef lines = CTFrameGetLines(_textFrame);
//
//            CGPoint lineOrigins[numberOfLines];
//            CTFrameGetLineOrigins(_textFrame, CFRangeMake(0, numberOfLines), lineOrigins);
//            NSAttributedString *attributedString = self.resultAttributedString;
//            for (CFIndex lineIndex = 0; lineIndex < numberOfLines; lineIndex++)
//            {
//                CGPoint lineOrigin = lineOrigins[lineIndex];
//                CGContextSetTextPosition(context, lineOrigin.x, lineOrigin.y);
//                CTLineRef line = CFArrayGetValueAtIndex(lines, lineIndex);
//
//                BOOL shouldDrawLine = YES;
//                if (lineIndex == numberOfLines - 1 )
//                {
//                    // Does the last line need truncation?
//                    CFRange lastLineRange = CTLineGetStringRange(line);
//                    if (lastLineRange.location + lastLineRange.length < attributedString.length)
//                    {
//                        CTLineTruncationType truncationType = kCTLineTruncationEnd;
//                        //加省略号的位置
//                        NSUInteger truncationAttributePosition = lastLineRange.location + lastLineRange.length - 1;
//                        //获取省略号位置的字符串属性
//                        NSDictionary *tokenAttributes = [attributedString attributesAtIndex:truncationAttributePosition
//                                                                             effectiveRange:NULL];
//                        //初始化省略号的属性字符串
//                        NSAttributedString *tokenString = [[NSAttributedString alloc] initWithString:kEllipsesCharacter
//                                                                                          attributes:tokenAttributes];
//                        //创建一行
//                        CTLineRef truncationToken = CTLineCreateWithAttributedString((CFAttributedStringRef)tokenString);
//                        NSMutableAttributedString *truncationString = [[attributedString attributedSubstringFromRange:NSMakeRange(lastLineRange.location, lastLineRange.length)] mutableCopy];
//
//                        if (lastLineRange.length > 0)
//                        {
//                            // Remove last token
//                            [truncationString deleteCharactersInRange:NSMakeRange(lastLineRange.length - 1, 1)];
//                        }
//                        [truncationString appendAttributedString:tokenString];
//
//                        //创建省略号的行
//                        CTLineRef truncationLine = CTLineCreateWithAttributedString((CFAttributedStringRef)truncationString);
//                        // 在省略号行的末尾加上省略号
//                        CTLineRef truncatedLine = CTLineCreateTruncatedLine(truncationLine, rect.size.width, truncationType, truncationToken);
//                        if (!truncatedLine)
//                        {
//                            // If the line is not as wide as the truncationToken, truncatedLine is NULL
//                            truncatedLine = CFRetain(truncationToken);
//                        }
//                        CFRelease(truncationLine);//CF得自己释放，ARC的不会释放
//                        CFRelease(truncationToken);
//
//                        CTLineDraw(truncatedLine, context);
//                        CFRelease(truncatedLine);
//
//                        shouldDrawLine = NO;
//                    }
//                }
//                if(shouldDrawLine)
//                {
//                    CTLineDraw(line, context);
//                }
//            }
//        }
//        else
//        {
//            CTFrameDraw(_textFrame,context);
//        }
//    }
//
//    CGContextRestoreGState(context);
//}
//
//
//@end

