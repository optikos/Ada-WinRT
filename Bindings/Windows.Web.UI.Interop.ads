--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.1.0.1                                                     --
--                                                                            --
-- This program is free software: you can redistribute it and / or modify     --
-- it under the terms of the GNU Lesser General Public License as published by--
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               --
-- GNU Lesser General Public License for more details.                        --
--                                                                            --
-- You should have received a copy of the GNU Lesser General Public License   --
-- along with this program.If not, see < http://www.gnu.org/licenses/>.       --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.UI;
limited with Windows.Web.Http;
limited with Windows.Storage.Streams;
limited with Windows.ApplicationModel.DataTransfer;
limited with Windows.UI.Core;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.Web.UI.Interop is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WebViewControlMoveFocusReason is (
      Programmatic,
      Next,
      Previous
   );
   for WebViewControlMoveFocusReason use (
      Programmatic => 0,
      Next => 1,
      Previous => 2
   );
   for WebViewControlMoveFocusReason'Size use 32;
   
   type WebViewControlMoveFocusReason_Ptr is access WebViewControlMoveFocusReason;
   
   type WebViewControlProcessCapabilityState is (
      Default,
      Disabled,
      Enabled
   );
   for WebViewControlProcessCapabilityState use (
      Default => 0,
      Disabled => 1,
      Enabled => 2
   );
   for WebViewControlProcessCapabilityState'Size use 32;
   
   type WebViewControlProcessCapabilityState_Ptr is access WebViewControlProcessCapabilityState;
   
   type WebViewControlAcceleratorKeyRoutingStage is (
      Tunneling,
      Bubbling
   );
   for WebViewControlAcceleratorKeyRoutingStage use (
      Tunneling => 0,
      Bubbling => 1
   );
   for WebViewControlAcceleratorKeyRoutingStage'Size use 32;
   
   type WebViewControlAcceleratorKeyRoutingStage_Ptr is access WebViewControlAcceleratorKeyRoutingStage;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested_Interface;
   type TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested is access all TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested_Interface'Class;
   type TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested_Ptr is access all TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested;
   type TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed_Interface;
   type TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed is access all TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed_Interface'Class;
   type TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed_Ptr is access all TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed;
   type TypedEventHandler_IWebViewControlProcess_add_ProcessExited_Interface;
   type TypedEventHandler_IWebViewControlProcess_add_ProcessExited is access all TypedEventHandler_IWebViewControlProcess_add_ProcessExited_Interface'Class;
   type TypedEventHandler_IWebViewControlProcess_add_ProcessExited_Ptr is access all TypedEventHandler_IWebViewControlProcess_add_ProcessExited;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWebViewControlSite_Interface;
   type IWebViewControlSite is access all IWebViewControlSite_Interface'Class;
   type IWebViewControlSite_Ptr is access all IWebViewControlSite;
   type IWebViewControlProcessOptions_Interface;
   type IWebViewControlProcessOptions is access all IWebViewControlProcessOptions_Interface'Class;
   type IWebViewControlProcessOptions_Ptr is access all IWebViewControlProcessOptions;
   type IWebViewControlProcessFactory_Interface;
   type IWebViewControlProcessFactory is access all IWebViewControlProcessFactory_Interface'Class;
   type IWebViewControlProcessFactory_Ptr is access all IWebViewControlProcessFactory;
   type IWebViewControlProcess_Interface;
   type IWebViewControlProcess is access all IWebViewControlProcess_Interface'Class;
   type IWebViewControlProcess_Ptr is access all IWebViewControlProcess;
   type IWebViewControlMoveFocusRequestedEventArgs_Interface;
   type IWebViewControlMoveFocusRequestedEventArgs is access all IWebViewControlMoveFocusRequestedEventArgs_Interface'Class;
   type IWebViewControlMoveFocusRequestedEventArgs_Ptr is access all IWebViewControlMoveFocusRequestedEventArgs;
   type IWebViewControlAcceleratorKeyPressedEventArgs_Interface;
   type IWebViewControlAcceleratorKeyPressedEventArgs is access all IWebViewControlAcceleratorKeyPressedEventArgs_Interface'Class;
   type IWebViewControlAcceleratorKeyPressedEventArgs_Ptr is access all IWebViewControlAcceleratorKeyPressedEventArgs;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlSite : aliased constant Windows.IID := (322914246, 4828, 18584, (189, 71, 4, 150, 125, 230, 72, 186 ));
   
   type IWebViewControlSite_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Process
   (
      This       : access IWebViewControlSite_Interface
      ; RetVal : access Windows.Web.UI.Interop.IWebViewControlProcess
   )
   return Windows.HRESULT is abstract;
   
   function put_Scale
   (
      This       : access IWebViewControlSite_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_Scale
   (
      This       : access IWebViewControlSite_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Bounds
   (
      This       : access IWebViewControlSite_Interface
      ; value : Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function get_Bounds
   (
      This       : access IWebViewControlSite_Interface
      ; RetVal : access Windows.Foundation.Rect
   )
   return Windows.HRESULT is abstract;
   
   function put_IsVisible
   (
      This       : access IWebViewControlSite_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsVisible
   (
      This       : access IWebViewControlSite_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function Close
   (
      This       : access IWebViewControlSite_Interface
   )
   return Windows.HRESULT is abstract;
   
   function MoveFocus
   (
      This       : access IWebViewControlSite_Interface
      ; reason : Windows.Web.UI.Interop.WebViewControlMoveFocusReason
   )
   return Windows.HRESULT is abstract;
   
   function add_MoveFocusRequested
   (
      This       : access IWebViewControlSite_Interface
      ; handler : TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MoveFocusRequested
   (
      This       : access IWebViewControlSite_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_AcceleratorKeyPressed
   (
      This       : access IWebViewControlSite_Interface
      ; handler : TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_AcceleratorKeyPressed
   (
      This       : access IWebViewControlSite_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlProcessOptions : aliased constant Windows.IID := (483029671, 15318, 18470, (130, 97, 108, 129, 137, 80, 93, 137 ));
   
   type IWebViewControlProcessOptions_Interface is interface and Windows.IInspectable_Interface;
   
   function put_EnterpriseId
   (
      This       : access IWebViewControlProcessOptions_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EnterpriseId
   (
      This       : access IWebViewControlProcessOptions_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_PrivateNetworkClientServerCapability
   (
      This       : access IWebViewControlProcessOptions_Interface
      ; value : Windows.Web.UI.Interop.WebViewControlProcessCapabilityState
   )
   return Windows.HRESULT is abstract;
   
   function get_PrivateNetworkClientServerCapability
   (
      This       : access IWebViewControlProcessOptions_Interface
      ; RetVal : access Windows.Web.UI.Interop.WebViewControlProcessCapabilityState
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlProcessFactory : aliased constant Windows.IID := (1203133689, 41682, 17724, (176, 151, 246, 119, 157, 75, 142, 2 ));
   
   type IWebViewControlProcessFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateWithOptions
   (
      This       : access IWebViewControlProcessFactory_Interface
      ; processOptions : Windows.Web.UI.Interop.IWebViewControlProcessOptions
      ; RetVal : access Windows.Web.UI.Interop.IWebViewControlProcess
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlProcess : aliased constant Windows.IID := (46605292, 39126, 16970, (182, 62, 198, 19, 108, 54, 160, 242 ));
   
   type IWebViewControlProcess_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ProcessId
   (
      This       : access IWebViewControlProcess_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_EnterpriseId
   (
      This       : access IWebViewControlProcess_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsPrivateNetworkClientServerCapabilityEnabled
   (
      This       : access IWebViewControlProcess_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function CreateWebViewControlAsync
   (
      This       : access IWebViewControlProcess_Interface
      ; hostWindowHandle : Windows.Int64
      ; bounds : Windows.Foundation.Rect
      ; RetVal : access Windows.Web.UI.IAsyncOperation_IWebViewControl -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetWebViewControls
   (
      This       : access IWebViewControlProcess_Interface
      ; RetVal : access Windows.Web.UI.IVectorView_IWebViewControl -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function Terminate_x
   (
      This       : access IWebViewControlProcess_Interface
   )
   return Windows.HRESULT is abstract;
   
   function add_ProcessExited
   (
      This       : access IWebViewControlProcess_Interface
      ; handler : TypedEventHandler_IWebViewControlProcess_add_ProcessExited
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ProcessExited
   (
      This       : access IWebViewControlProcess_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlMoveFocusRequestedEventArgs : aliased constant Windows.IID := (1797927949, 19408, 16478, (183, 193, 30, 114, 164, 146, 244, 70 ));
   
   type IWebViewControlMoveFocusRequestedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Reason
   (
      This       : access IWebViewControlMoveFocusRequestedEventArgs_Interface
      ; RetVal : access Windows.Web.UI.Interop.WebViewControlMoveFocusReason
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebViewControlAcceleratorKeyPressedEventArgs : aliased constant Windows.IID := (2007147838, 31860, 17277, (162, 144, 58, 192, 216, 205, 86, 85 ));
   
   type IWebViewControlAcceleratorKeyPressedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EventType
   (
      This       : access IWebViewControlAcceleratorKeyPressedEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CoreAcceleratorKeyEventType
   )
   return Windows.HRESULT is abstract;
   
   function get_VirtualKey
   (
      This       : access IWebViewControlAcceleratorKeyPressedEventArgs_Interface
      ; RetVal : access Windows.System.VirtualKey
   )
   return Windows.HRESULT is abstract;
   
   function get_KeyStatus
   (
      This       : access IWebViewControlAcceleratorKeyPressedEventArgs_Interface
      ; RetVal : access Windows.UI.Core.CorePhysicalKeyStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_RoutingStage
   (
      This       : access IWebViewControlAcceleratorKeyPressedEventArgs_Interface
      ; RetVal : access Windows.Web.UI.Interop.WebViewControlAcceleratorKeyRoutingStage
   )
   return Windows.HRESULT is abstract;
   
   function get_Handled
   (
      This       : access IWebViewControlAcceleratorKeyPressedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Handled
   (
      This       : access IWebViewControlAcceleratorKeyPressedEventArgs_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested : aliased constant Windows.IID := (592265408, 11345, 20776, (185, 25, 0, 63, 28, 10, 138, 38 ));
   
   type TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.Interop.IWebViewControlMoveFocusRequestedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControlSite_add_MoveFocusRequested_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.Interop.IWebViewControlMoveFocusRequestedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed : aliased constant Windows.IID := (2991487835, 47108, 21318, (151, 181, 2, 230, 217, 182, 203, 168 ));
   
   type TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed_Interface(Callback : access procedure (sender : Windows.Web.UI.IWebViewControl ; args : Windows.Web.UI.Interop.IWebViewControlAcceleratorKeyPressedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControlSite_add_AcceleratorKeyPressed_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.Interop.IWebViewControlAcceleratorKeyPressedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebViewControlProcess_add_ProcessExited : aliased constant Windows.IID := (205619956, 52300, 22003, (180, 33, 212, 231, 73, 235, 128, 161 ));
   
   type TypedEventHandler_IWebViewControlProcess_add_ProcessExited_Interface(Callback : access procedure (sender : Windows.Web.UI.Interop.IWebViewControlProcess ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebViewControlProcess_add_ProcessExited'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControlProcess_add_ProcessExited_Interface
      ; sender : Windows.Web.UI.Interop.IWebViewControlProcess
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WebViewControlProcess is Windows.Web.UI.Interop.IWebViewControlProcess;
   function CreateWithOptions
   (
      processOptions : Windows.Web.UI.Interop.IWebViewControlProcessOptions
   )
   return Windows.Web.UI.Interop.IWebViewControlProcess;
   
   subtype WebViewControl is Windows.Web.UI.IWebViewControl;
   subtype WebViewControlMoveFocusRequestedEventArgs is Windows.Web.UI.Interop.IWebViewControlMoveFocusRequestedEventArgs;
   subtype WebViewControlAcceleratorKeyPressedEventArgs is Windows.Web.UI.Interop.IWebViewControlAcceleratorKeyPressedEventArgs;
   subtype WebViewControlProcessOptions is Windows.Web.UI.Interop.IWebViewControlProcessOptions;
   function CreateWebViewControlProcessOptions return Windows.Web.UI.Interop.IWebViewControlProcessOptions;
   
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
end;