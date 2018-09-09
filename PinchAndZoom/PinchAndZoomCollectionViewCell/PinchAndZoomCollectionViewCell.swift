//
//  PinchAndZoomCollectionViewCell.swift
//  PinchAndZoom
//
//  Created by Mark on 09/09/2018.
//  Copyright © 2018 Mark. All rights reserved.
//

import UIKit

class PinchAndZoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    private var doubleTapGestureRecognizer: UITapGestureRecognizer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initViews()
    }
    
    private func initViews() {
        initScrollView()
        initImageView()
    }

    private func initScrollView() {
        scrollView.delegate = self
        scrollView.maximumZoomScale = 5
        scrollView.minimumZoomScale = 1
    }
    
    private func initImageView() {
        imageView.contentMode = .scaleAspectFit
        enableDoubleTapToZoom(forImageView: imageView)
    }
    
    private func enableDoubleTapToZoom(forImageView imageView: UIImageView) {
        let selector = #selector(doubleTapGestureHandler(_:))
        doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: selector)
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(doubleTapGestureRecognizer)
        imageView.isUserInteractionEnabled = true
    }
    
    // MARK: Actions
    
    @objc func doubleTapGestureHandler(_ gesture: UITapGestureRecognizer) {
        
        guard scrollView.zoomScale <= 1.0 else {
            scrollView.setZoomScale(1.0, animated: true)
            return
        }
        
        let tapOrigin = gesture.location(in: gesture.view!)
        
        let zoomingAreaWidth: CGFloat = 200.0
        let zoomingAreaHeight: CGFloat = 200.0
        
        let zoomArea = CGRect(x: tapOrigin.x - zoomingAreaWidth/2,
                              y: tapOrigin.y - zoomingAreaHeight/2,
                              width: zoomingAreaWidth,
                              height: zoomingAreaHeight)
        
        scrollView.zoom(to: zoomArea, animated: true)
    }
    
}

extension PinchAndZoomCollectionViewCell: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
