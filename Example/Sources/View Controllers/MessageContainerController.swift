// MIT License
//
// Copyright (c) 2017-2019 MessageKit
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import MapKit
import UIKit

final class MessageContainerController: UIViewController {
  let mapView = MKMapView()

  let bannerView: UIView = {
    let view = UIView()
    view.backgroundColor = .primaryColor
    view.alpha = 0.7
    return view
  }()

  let conversationViewController = BasicExampleViewController()

  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }

  /// Required for the `MessageInputBar` to be visible
  override var canBecomeFirstResponder: Bool {
    conversationViewController.canBecomeFirstResponder
  }

  /// Required for the `MessageInputBar` to be visible
  override var inputAccessoryView: UIView? {
    conversationViewController.inputAccessoryView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    /// Add the `ConversationViewController` as a child view controller
    conversationViewController.willMove(toParent: self)
    addChild(conversationViewController)
    view.addSubview(conversationViewController.view)
    conversationViewController.didMove(toParent: self)

    view.addSubview(mapView)
    view.addSubview(bannerView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let headerHeight: CGFloat = 200
    mapView.frame = CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: headerHeight))
    bannerView.frame = CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: headerHeight))
    conversationViewController.view.frame = CGRect(
      x: 0,
      y: headerHeight,
      width: view.bounds.width,
      height: view.bounds.height - headerHeight)
  }
}
