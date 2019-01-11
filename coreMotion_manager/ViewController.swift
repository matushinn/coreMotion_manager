//
//  ViewController.swift
//  coreMotion_manager
//
//  Created by 大江祥太郎 on 2019/01/11.
//  Copyright © 2019年 shotaro. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var xGyroLabel: UILabel!
    @IBOutlet weak var yGyroLabel: UILabel!
    @IBOutlet weak var zGyroLabel: UILabel!
    
    @IBOutlet weak var xAccelLabel: UILabel!
    @IBOutlet weak var yAccelLabel: UILabel!
    @IBOutlet weak var zAccelLabel: UILabel!
    
    
    @IBOutlet weak var xGravityLabel: UILabel!
    @IBOutlet weak var yGravityLabel: UILabel!
    @IBOutlet weak var zGravityLabel: UILabel!
    
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var rollLabel: UILabel!
    @IBOutlet weak var yawLabel: UILabel!
    
    //モーションマネージャーを作る
    let motionManager = CMMotionManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //キューを実行する間隔
        motionManager.deviceMotionUpdateInterval = 0.1
        //キューを実行するクロージャ
        let handler:CMDeviceMotionHandler = {(motionData: CMDeviceMotion?, error: NSError?) -> Void in
            self.motionAnimation(motionData, error: error as NSError?)
        }
        
        
        //更新で実行するキューを登録してモーションセンサーをスタートする
        motionManager.startDeviceMotionUpdates(to:OperationQueue.main,withHandler:handler)
        
        
    }
    //デバイスモーションセンサーで定期的に実行するメソッド
    func motionAnimation(motionData:CMDeviceMotion?,error:NSError?){
        
        if let motion = motionData{
            //ジャイロスコープ
            //x軸回転角速度
            var gyroX = motion.rotationRate.x
            gyroX = round(gyroX*100)/100
            xGyroLabel.text = String(gyroX)
            
            //y軸回転角速度
            var gyroY = motion.rotationRate.y
            gyroY = round(gyroY*100)/100
            yGyroLabel.text = String(gyroY)
            
            //z軸回転角速度
            var gyroZ = motion.rotationRate.z
            gyroZ = round(gyroZ*100)/100
            zGyroLabel.text = String(gyroZ)
            
            //加速度センサー
            //x軸方向加速度
            var accelX = motion.userAcceleration.x
            accelX = round(accelX*100)/100
            xAccelLabel.text = String(accelX)
            
            //y軸方向加速度
            var accelY = motion.userAcceleration.y
            accelY = round(accelY*100)/100
            yAccelLabel.text = String(accelY)
            
            //z軸方向加速度
            var accelZ = motion.userAcceleration.z
            accelZ = round(accelZ*100)/100
            zAccelLabel.text = String(accelZ)
            
            
            //重力ベクトル
            //加速度のX成分
            var gravityX = motion.gravity.x
            gravityX = round(gravityX*100)/100
            xGravityLabel.text = String(gravityX)
            
            //加速度のy成分
            var gravityY = motion.gravity.y
            gravityY = round(gravityY*100)/100
            yGravityLabel.text = String(gravityY)
            
            //加速度のz成分
            var gravityZ = motion.gravity.z
            gravityZ = round(gravityZ*100)/100
            zGravityLabel.text = String(gravityZ)
            
            //姿勢センサー
            //ピッチ（x軸周り回転角ど）
            var pitch = motion.attitude.pitch
            pitch = round(pitch*100)/100
            pitchLabel.text = String(pitch)
            
            //ロール（x軸周り回転角ど）
            var roll = motion.attitude.roll
            roll = round(roll*100)/100
            rollLabel.text = String(roll)
            
            //ヨー（x軸周り回転角ど）
            var yaw = motion.attitude.yaw
            yaw = round(yaw*100)/100
            yawLabel.text = String(yaw)
            
            
        }
        
    }


}

