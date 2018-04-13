//
//  BurgerView.swift
//
//  Code generated using QuartzCode 1.65.0 on 12.04.2018.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class BurgerView: UIView, CAAnimationDelegate {
    
    var layers = [String: CALayer]()
    var completionBlocks = [CAAnimation: (Bool) -> Void]()
    var updateLayerValueForCompletedAnimation : Bool = false
    
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupProperties()
        setupLayers()
    }
    
    override var frame: CGRect{
        didSet{
            setupLayerFrames()
        }
    }
    
    override var bounds: CGRect{
        didSet{
            setupLayerFrames()
        }
    }
    
    func setupProperties(){
        
    }
    
    func setupLayers(){
        self.backgroundColor = UIColor(red:1.00, green: 1.00, blue:1.00, alpha:1.0)
        
        let Group = CALayer()
        self.layer.addSublayer(Group)
        layers["Group"] = Group
        let rectangle1 = CAShapeLayer()
        Group.addSublayer(rectangle1)
        layers["rectangle1"] = rectangle1
        let rectangle3 = CAShapeLayer()
        Group.addSublayer(rectangle3)
        layers["rectangle3"] = rectangle3
        let rectangle2 = CAShapeLayer()
        Group.addSublayer(rectangle2)
        layers["rectangle2"] = rectangle2
        
        resetLayerProperties(forLayerIdentifiers: nil)
        setupLayerFrames()
    }
    
    func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if layerIds == nil || layerIds.contains("rectangle1"){
            let rectangle1 = layers["rectangle1"] as! CAShapeLayer
            rectangle1.lineCap     = kCALineCapRound
            rectangle1.lineJoin    = kCALineJoinRound
            rectangle1.fillColor   = UIColor(red:0.937, green: 0.937, blue:0.937, alpha:1).cgColor
            rectangle1.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:1).cgColor
            rectangle1.lineWidth   = 2
        }
        if layerIds == nil || layerIds.contains("rectangle3"){
            let rectangle3 = layers["rectangle3"] as! CAShapeLayer
            rectangle3.lineCap     = kCALineCapRound
            rectangle3.lineJoin    = kCALineJoinRound
            rectangle3.fillColor   = UIColor(red:0.937, green: 0.937, blue:0.937, alpha:1).cgColor
            rectangle3.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:1).cgColor
            rectangle3.lineWidth   = 2
        }
        if layerIds == nil || layerIds.contains("rectangle2"){
            let rectangle2 = layers["rectangle2"] as! CAShapeLayer
            rectangle2.lineCap     = kCALineCapRound
            rectangle2.lineJoin    = kCALineJoinRound
            rectangle2.fillColor   = UIColor(red:0.937, green: 0.937, blue:0.937, alpha:1).cgColor
            rectangle2.strokeColor = UIColor(red:0.404, green: 0.404, blue:0.404, alpha:1).cgColor
            rectangle2.lineWidth   = 2
        }
        
        CATransaction.commit()
    }
    
    func setupLayerFrames(){
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        if let Group = layers["Group"]{
            Group.frame = CGRect(x: 0.1 * Group.superlayer!.bounds.width, y: 0.2125 * Group.superlayer!.bounds.height, width: 0.8 * Group.superlayer!.bounds.width, height: 0.575 * Group.superlayer!.bounds.height)
        }
        
        if let rectangle1 = layers["rectangle1"] as? CAShapeLayer{
            rectangle1.frame = CGRect(x: 0, y: 0, width:  rectangle1.superlayer!.bounds.width, height: 0)
            rectangle1.path  = rectangle1Path(bounds: layers["rectangle1"]!.bounds).cgPath
        }
        
        if let rectangle3 = layers["rectangle3"] as? CAShapeLayer{
            rectangle3.frame = CGRect(x: 0, y:  rectangle3.superlayer!.bounds.height, width:  rectangle3.superlayer!.bounds.width, height: 0)
            rectangle3.path  = rectangle3Path(bounds: layers["rectangle3"]!.bounds).cgPath
        }
        
        if let rectangle2 = layers["rectangle2"] as? CAShapeLayer{
            rectangle2.frame = CGRect(x: 0, y: 0.5 * rectangle2.superlayer!.bounds.height, width:  rectangle2.superlayer!.bounds.width, height: 0)
            rectangle2.path  = rectangle2Path(bounds: layers["rectangle2"]!.bounds).cgPath
        }
        
        CATransaction.commit()
    }
    
    //MARK: - Animation Setup
    
    func addBurgerToArrowAnimation(reverseAnimation: Bool = false, completionBlock: ((_ finished: Bool) -> Void)? = nil){
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = 1.002
            completionAnim.delegate = self
            completionAnim.setValue("burgerToArrow", forKey:"animId")
            completionAnim.setValue(false, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"burgerToArrow")
            if let anim = layer.animation(forKey: "burgerToArrow"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
        
        let totalDuration : CFTimeInterval = 1.002
        
        let rectangle1 = layers["rectangle1"] as! CAShapeLayer
        
        ////Rectangle1 animation
        let rectangle1TransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        rectangle1TransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                                  NSValue(caTransform3D: CATransform3DConcat(CATransform3DConcat(CATransform3DMakeScale(0.5, 1, 1), CATransform3DMakeTranslation(-0.325 * rectangle1.superlayer!.bounds.width, 0.17391 * rectangle1.superlayer!.bounds.height, 0)), CATransform3DMakeRotation(-20 * CGFloat.pi/180, -0, 0, 1)))]
        rectangle1TransformAnim.keyTimes       = [0, 1]
        rectangle1TransformAnim.duration       = 1
        rectangle1TransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        var rectangle1BurgerToArrowAnim : CAAnimationGroup = QCMethod.group(animations: [rectangle1TransformAnim], fillMode:fillMode)
        if (reverseAnimation){ rectangle1BurgerToArrowAnim = QCMethod.reverseAnimation(anim: rectangle1BurgerToArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        rectangle1.add(rectangle1BurgerToArrowAnim, forKey:"rectangle1BurgerToArrowAnim")
        
        let rectangle3 = layers["rectangle3"] as! CAShapeLayer
        
        ////Rectangle3 animation
        let rectangle3TransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        rectangle3TransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity),
                                                  NSValue(caTransform3D: CATransform3DConcat(CATransform3DConcat(CATransform3DMakeScale(0.5, 1, 1), CATransform3DMakeTranslation(-0.325 * rectangle3.superlayer!.bounds.width, -0.17391 * rectangle3.superlayer!.bounds.height, 0)), CATransform3DMakeRotation(20 * CGFloat.pi/180, 0, -0, 1)))]
        rectangle3TransformAnim.keyTimes       = [0, 1]
        rectangle3TransformAnim.duration       = 1
        rectangle3TransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        var rectangle3BurgerToArrowAnim : CAAnimationGroup = QCMethod.group(animations: [rectangle3TransformAnim], fillMode:fillMode)
        if (reverseAnimation){ rectangle3BurgerToArrowAnim = QCMethod.reverseAnimation(anim: rectangle3BurgerToArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        rectangle3.add(rectangle3BurgerToArrowAnim, forKey:"rectangle3BurgerToArrowAnim")
        
        let rectangle2 = layers["rectangle2"] as! CAShapeLayer
        
        ////Rectangle2 animation
        let rectangle2TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
        rectangle2TransformAnim.values   = [NSValue(caTransform3D: CATransform3DIdentity),
                                            NSValue(caTransform3D: CATransform3DConcat(CATransform3DMakeScale(0.7, 1, 1), CATransform3DMakeTranslation(-0.125 * rectangle2.superlayer!.bounds.width, 0, 0)))]
        rectangle2TransformAnim.keyTimes = [0, 1]
        rectangle2TransformAnim.duration = 1
        
        var rectangle2BurgerToArrowAnim : CAAnimationGroup = QCMethod.group(animations: [rectangle2TransformAnim], fillMode:fillMode)
        if (reverseAnimation){ rectangle2BurgerToArrowAnim = QCMethod.reverseAnimation(anim: rectangle2BurgerToArrowAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        rectangle2.add(rectangle2BurgerToArrowAnim, forKey:"rectangle2BurgerToArrowAnim")
    }
    
    //MARK: - Animation Cleanup
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let completionBlock = completionBlocks[anim]{
            completionBlocks.removeValue(forKey: anim)
            if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
                updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
                removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
            }
            completionBlock(flag)
        }
    }
    
    func updateLayerValues(forAnimationId identifier: String){
        if identifier == "burgerToArrow"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["rectangle1"]!.animation(forKey: "rectangle1BurgerToArrowAnim"), theLayer:layers["rectangle1"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["rectangle3"]!.animation(forKey: "rectangle3BurgerToArrowAnim"), theLayer:layers["rectangle3"]!)
            QCMethod.updateValueFromPresentationLayer(forAnimation: layers["rectangle2"]!.animation(forKey: "rectangle2BurgerToArrowAnim"), theLayer:layers["rectangle2"]!)
        }
    }
    
    func removeAnimations(forAnimationId identifier: String){
        if identifier == "burgerToArrow"{
            layers["rectangle1"]?.removeAnimation(forKey: "rectangle1BurgerToArrowAnim")
            layers["rectangle3"]?.removeAnimation(forKey: "rectangle3BurgerToArrowAnim")
            layers["rectangle2"]?.removeAnimation(forKey: "rectangle2BurgerToArrowAnim")
        }
    }
    
    func removeAllAnimations(){
        for layer in layers.values{
            layer.removeAllAnimations()
        }
    }
    
    //MARK: - Bezier Path
    
    func rectangle1Path(bounds: CGRect) -> UIBezierPath{
        let rectangle1Path = UIBezierPath(rect:bounds)
        return rectangle1Path
    }
    
    func rectangle3Path(bounds: CGRect) -> UIBezierPath{
        let rectangle3Path = UIBezierPath(rect:bounds)
        return rectangle3Path
    }
    
    func rectangle2Path(bounds: CGRect) -> UIBezierPath{
        let rectangle2Path = UIBezierPath(rect:bounds)
        return rectangle2Path
    }
    
    
}
