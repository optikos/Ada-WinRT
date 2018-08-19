--------------------------------------------------------------------------------
--                                                                            --
--    Copyright(c) 2018 Alexander Gamper, All Rights Reserved.                --
--                                                                            --
--    Ada-WinRT                                                               --
--    Version   : 0.2.0.1                                                     --
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
-- along with this program.If not, see http://www.gnu.org/licenses            --
--                                                                            --
--------------------------------------------------------------------------------
with Windows.Foundation;
with Windows.Foundation.Collections;
package Windows.UI.WebUI.Core is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type WebUICommandBarClosedDisplayMode is (
      Default,
      Minimal,
      Compact
   );
   for WebUICommandBarClosedDisplayMode use (
      Default => 0,
      Minimal => 1,
      Compact => 2
   );
   for WebUICommandBarClosedDisplayMode'Size use 32;
   
   type WebUICommandBarClosedDisplayMode_Ptr is access WebUICommandBarClosedDisplayMode;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   type WebUICommandBarContract is null record;
   pragma Convention (C_Pass_By_Copy , WebUICommandBarContract);
   
   type WebUICommandBarContract_Ptr is access WebUICommandBarContract;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type MenuOpenedEventHandler_Interface;
   type MenuOpenedEventHandler is access all MenuOpenedEventHandler_Interface'Class;
   type MenuOpenedEventHandler_Ptr is access all MenuOpenedEventHandler;
   type MenuClosedEventHandler_Interface;
   type MenuClosedEventHandler is access all MenuClosedEventHandler_Interface'Class;
   type MenuClosedEventHandler_Ptr is access all MenuClosedEventHandler;
   type SizeChangedEventHandler_Interface;
   type SizeChangedEventHandler is access all SizeChangedEventHandler_Interface'Class;
   type SizeChangedEventHandler_Ptr is access all SizeChangedEventHandler;
   type TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked_Interface;
   type TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked is access all TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked_Interface'Class;
   type TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked_Ptr is access all TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked;
   type TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked_Interface;
   type TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked is access all TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked_Interface'Class;
   type TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked_Ptr is access all TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked;
   type VectorChangedEventHandler_IWebUICommandBarElement_Interface;
   type VectorChangedEventHandler_IWebUICommandBarElement is access all VectorChangedEventHandler_IWebUICommandBarElement_Interface'Class;
   type VectorChangedEventHandler_IWebUICommandBarElement_Ptr is access all VectorChangedEventHandler_IWebUICommandBarElement;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IWebUICommandBarItemInvokedEventArgs_Interface;
   type IWebUICommandBarItemInvokedEventArgs is access all IWebUICommandBarItemInvokedEventArgs_Interface'Class;
   type IWebUICommandBarItemInvokedEventArgs_Ptr is access all IWebUICommandBarItemInvokedEventArgs;
   type IWebUICommandBarElement_Interface;
   type IWebUICommandBarElement is access all IWebUICommandBarElement_Interface'Class;
   type IWebUICommandBarElement_Ptr is access all IWebUICommandBarElement;
   type IWebUICommandBarIcon_Interface;
   type IWebUICommandBarIcon is access all IWebUICommandBarIcon_Interface'Class;
   type IWebUICommandBarIcon_Ptr is access all IWebUICommandBarIcon;
   type IWebUICommandBarIconButton_Interface;
   type IWebUICommandBarIconButton is access all IWebUICommandBarIconButton_Interface'Class;
   type IWebUICommandBarIconButton_Ptr is access all IWebUICommandBarIconButton;
   type IWebUICommandBarConfirmationButton_Interface;
   type IWebUICommandBarConfirmationButton is access all IWebUICommandBarConfirmationButton_Interface'Class;
   type IWebUICommandBarConfirmationButton_Ptr is access all IWebUICommandBarConfirmationButton;
   type IWebUICommandBarBitmapIcon_Interface;
   type IWebUICommandBarBitmapIcon is access all IWebUICommandBarBitmapIcon_Interface'Class;
   type IWebUICommandBarBitmapIcon_Ptr is access all IWebUICommandBarBitmapIcon;
   type IWebUICommandBarBitmapIconFactory_Interface;
   type IWebUICommandBarBitmapIconFactory is access all IWebUICommandBarBitmapIconFactory_Interface'Class;
   type IWebUICommandBarBitmapIconFactory_Ptr is access all IWebUICommandBarBitmapIconFactory;
   type IWebUICommandBarSymbolIcon_Interface;
   type IWebUICommandBarSymbolIcon is access all IWebUICommandBarSymbolIcon_Interface'Class;
   type IWebUICommandBarSymbolIcon_Ptr is access all IWebUICommandBarSymbolIcon;
   type IWebUICommandBarSymbolIconFactory_Interface;
   type IWebUICommandBarSymbolIconFactory is access all IWebUICommandBarSymbolIconFactory_Interface'Class;
   type IWebUICommandBarSymbolIconFactory_Ptr is access all IWebUICommandBarSymbolIconFactory;
   type IWebUICommandBarSizeChangedEventArgs_Interface;
   type IWebUICommandBarSizeChangedEventArgs is access all IWebUICommandBarSizeChangedEventArgs_Interface'Class;
   type IWebUICommandBarSizeChangedEventArgs_Ptr is access all IWebUICommandBarSizeChangedEventArgs;
   type IWebUICommandBar_Interface;
   type IWebUICommandBar is access all IWebUICommandBar_Interface'Class;
   type IWebUICommandBar_Ptr is access all IWebUICommandBar;
   type IWebUICommandBarStatics_Interface;
   type IWebUICommandBarStatics is access all IWebUICommandBarStatics_Interface'Class;
   type IWebUICommandBarStatics_Ptr is access all IWebUICommandBarStatics;
   type IIterator_IWebUICommandBarElement_Interface;
   type IIterator_IWebUICommandBarElement is access all IIterator_IWebUICommandBarElement_Interface'Class;
   type IIterator_IWebUICommandBarElement_Ptr is access all IIterator_IWebUICommandBarElement;
   type IIterable_IWebUICommandBarElement_Interface;
   type IIterable_IWebUICommandBarElement is access all IIterable_IWebUICommandBarElement_Interface'Class;
   type IIterable_IWebUICommandBarElement_Ptr is access all IIterable_IWebUICommandBarElement;
   type IVectorView_IWebUICommandBarElement_Interface;
   type IVectorView_IWebUICommandBarElement is access all IVectorView_IWebUICommandBarElement_Interface'Class;
   type IVectorView_IWebUICommandBarElement_Ptr is access all IVectorView_IWebUICommandBarElement;
   type IVector_IWebUICommandBarElement_Interface;
   type IVector_IWebUICommandBarElement is access all IVector_IWebUICommandBarElement_Interface'Class;
   type IVector_IWebUICommandBarElement_Ptr is access all IVector_IWebUICommandBarElement;
   type IObservableVector_IWebUICommandBarElement_Interface;
   type IObservableVector_IWebUICommandBarElement is access all IObservableVector_IWebUICommandBarElement_Interface'Class;
   type IObservableVector_IWebUICommandBarElement_Ptr is access all IObservableVector_IWebUICommandBarElement;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarItemInvokedEventArgs : aliased constant Windows.IID := (810474461, 59201, 16879, (189, 196, 164, 92, 234, 42, 79, 112 ));
   
   type IWebUICommandBarItemInvokedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_IsPrimaryCommand
   (
      This       : access IWebUICommandBarItemInvokedEventArgs_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarElement : aliased constant Windows.IID := (3372654274, 10314, 17971, (138, 173, 99, 122, 39, 226, 130, 195 ));
   
   type IWebUICommandBarElement_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarIcon : aliased constant Windows.IID := (3582420317, 8212, 17086, (150, 154, 125, 20, 202, 108, 138, 73 ));
   
   type IWebUICommandBarIcon_Interface is interface and Windows.IInspectable_Interface;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarIconButton : aliased constant Windows.IID := (2400962874, 14972, 18498, (160, 207, 175, 246, 234, 48, 133, 134 ));
   
   type IWebUICommandBarIconButton_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Enabled
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Enabled
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Label
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Label
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsToggleButton
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsToggleButton
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_IsChecked
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsChecked
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Icon
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; RetVal : access Windows.UI.WebUI.Core.IWebUICommandBarIcon
   )
   return Windows.HRESULT is abstract;
   
   function put_Icon
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; value : Windows.UI.WebUI.Core.IWebUICommandBarIcon
   )
   return Windows.HRESULT is abstract;
   
   function add_ItemInvoked
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; handler : TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemInvoked
   (
      This       : access IWebUICommandBarIconButton_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarConfirmationButton : aliased constant Windows.IID := (2263319114, 58325, 20150, (178, 255, 143, 1, 138, 23, 33, 5 ));
   
   type IWebUICommandBarConfirmationButton_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Text
   (
      This       : access IWebUICommandBarConfirmationButton_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Text
   (
      This       : access IWebUICommandBarConfirmationButton_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function add_ItemInvoked
   (
      This       : access IWebUICommandBarConfirmationButton_Interface
      ; handler : TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_ItemInvoked
   (
      This       : access IWebUICommandBarConfirmationButton_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarBitmapIcon : aliased constant Windows.IID := (2240761669, 2264, 19014, (129, 236, 0, 1, 91, 11, 28, 108 ));
   
   type IWebUICommandBarBitmapIcon_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Uri
   (
      This       : access IWebUICommandBarBitmapIcon_Interface
      ; RetVal : access Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   function put_Uri
   (
      This       : access IWebUICommandBarBitmapIcon_Interface
      ; value : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarBitmapIconFactory : aliased constant Windows.IID := (4093106058, 30323, 17482, (190, 98, 172, 18, 211, 28, 34, 49 ));
   
   type IWebUICommandBarBitmapIconFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IWebUICommandBarBitmapIconFactory_Interface
      ; uri : Windows.Foundation.IUriRuntimeClass
      ; RetVal : access Windows.UI.WebUI.Core.IWebUICommandBarBitmapIcon
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarSymbolIcon : aliased constant Windows.IID := (3566425207, 64806, 18157, (134, 88, 26, 63, 68, 0, 231, 179 ));
   
   type IWebUICommandBarSymbolIcon_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Symbol
   (
      This       : access IWebUICommandBarSymbolIcon_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_Symbol
   (
      This       : access IWebUICommandBarSymbolIcon_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarSymbolIconFactory : aliased constant Windows.IID := (1371413023, 14128, 17054, (182, 34, 20, 226, 183, 191, 106, 7 ));
   
   type IWebUICommandBarSymbolIconFactory_Interface is interface and Windows.IInspectable_Interface;
   
   function Create
   (
      This       : access IWebUICommandBarSymbolIconFactory_Interface
      ; symbol : Windows.String
      ; RetVal : access Windows.UI.WebUI.Core.IWebUICommandBarSymbolIcon
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarSizeChangedEventArgs : aliased constant Windows.IID := (4226933494, 12329, 18201, (131, 120, 146, 248, 43, 135, 175, 30 ));
   
   type IWebUICommandBarSizeChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Size
   (
      This       : access IWebUICommandBarSizeChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBar : aliased constant Windows.IID := (2767978518, 56293, 16813, (141, 123, 20, 105, 139, 214, 145, 29 ));
   
   type IWebUICommandBar_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Visible
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Visible
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Opacity
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function put_Opacity
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.Double
   )
   return Windows.HRESULT is abstract;
   
   function get_ForegroundColor
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_ForegroundColor
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_BackgroundColor
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function put_BackgroundColor
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.UI.Color
   )
   return Windows.HRESULT is abstract;
   
   function get_ClosedDisplayMode
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.UI.WebUI.Core.WebUICommandBarClosedDisplayMode
   )
   return Windows.HRESULT is abstract;
   
   function put_ClosedDisplayMode
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.UI.WebUI.Core.WebUICommandBarClosedDisplayMode
   )
   return Windows.HRESULT is abstract;
   
   function get_IsOpen
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_IsOpen
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.Foundation.Size
   )
   return Windows.HRESULT is abstract;
   
   function get_PrimaryCommands
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.UI.WebUI.Core.IObservableVector_IWebUICommandBarElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_SecondaryCommands
   (
      This       : access IWebUICommandBar_Interface
      ; RetVal : access Windows.UI.WebUI.Core.IObservableVector_IWebUICommandBarElement -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_MenuOpened
   (
      This       : access IWebUICommandBar_Interface
      ; handler : Windows.UI.WebUI.Core.MenuOpenedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MenuOpened
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_MenuClosed
   (
      This       : access IWebUICommandBar_Interface
      ; handler : Windows.UI.WebUI.Core.MenuClosedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_MenuClosed
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_SizeChanged
   (
      This       : access IWebUICommandBar_Interface
      ; handler : Windows.UI.WebUI.Core.SizeChangedEventHandler
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_SizeChanged
   (
      This       : access IWebUICommandBar_Interface
      ; value : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IWebUICommandBarStatics : aliased constant Windows.IID := (340381113, 42246, 17854, (143, 66, 178, 131, 126, 47, 224, 201 ));
   
   type IWebUICommandBarStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForCurrentView
   (
      This       : access IWebUICommandBarStatics_Interface
      ; RetVal : access Windows.UI.WebUI.Core.IWebUICommandBar
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterator_IWebUICommandBarElement : aliased constant Windows.IID := (3055700339, 49574, 22017, (176, 0, 181, 224, 120, 116, 107, 197 ));
   
   type IIterator_IWebUICommandBarElement_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IWebUICommandBarElement_Interface
      ; RetVal : access Windows.UI.WebUI.Core.IWebUICommandBarElement
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IWebUICommandBarElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IWebUICommandBarElement_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IWebUICommandBarElement_Interface
      ; items : Windows.UI.WebUI.Core.IWebUICommandBarElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IIterable_IWebUICommandBarElement : aliased constant Windows.IID := (1018306061, 45715, 20754, (188, 204, 110, 146, 182, 50, 29, 47 ));
   
   type IIterable_IWebUICommandBarElement_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IWebUICommandBarElement_Interface
      ; RetVal : access Windows.UI.WebUI.Core.IIterator_IWebUICommandBarElement
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVectorView_IWebUICommandBarElement : aliased constant Windows.IID := (3127033882, 11445, 22806, (162, 197, 210, 40, 158, 22, 178, 178 ));
   
   type IVectorView_IWebUICommandBarElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IWebUICommandBarElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.WebUI.Core.IWebUICommandBarElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IWebUICommandBarElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IWebUICommandBarElement_Interface
      ; value : Windows.UI.WebUI.Core.IWebUICommandBarElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IWebUICommandBarElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.WebUI.Core.IWebUICommandBarElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IVector_IWebUICommandBarElement : aliased constant Windows.IID := (1250545377, 22213, 24066, (186, 143, 82, 180, 54, 183, 19, 119 ));
   
   type IVector_IWebUICommandBarElement_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.UI.WebUI.Core.IWebUICommandBarElement
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function GetView
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; RetVal : access Windows.UI.WebUI.Core.IVectorView_IWebUICommandBarElement
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; value : Windows.UI.WebUI.Core.IWebUICommandBarElement
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function SetAt
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.WebUI.Core.IWebUICommandBarElement
   )
   return Windows.HRESULT is abstract;
   
   function InsertAt
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; index : Windows.UInt32
      ; value : Windows.UI.WebUI.Core.IWebUICommandBarElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAt
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; index : Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function Append
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; value : Windows.UI.WebUI.Core.IWebUICommandBarElement
   )
   return Windows.HRESULT is abstract;
   
   function RemoveAtEnd
   (
      This       : access IVector_IWebUICommandBarElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function Clear
   (
      This       : access IVector_IWebUICommandBarElement_Interface
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.UI.WebUI.Core.IWebUICommandBarElement_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function ReplaceAll
   (
      This       : access IVector_IWebUICommandBarElement_Interface
      ; items : Windows.UI.WebUI.Core.IWebUICommandBarElement_Ptr
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IObservableVector_IWebUICommandBarElement : aliased constant Windows.IID := (3009407819, 6195, 23032, (177, 70, 70, 39, 129, 58, 241, 137 ));
   
   type IObservableVector_IWebUICommandBarElement_Interface is interface and Windows.IInspectable_Interface;
   
   function add_VectorChanged
   (
      This       : access IObservableVector_IWebUICommandBarElement_Interface
      ; vhnd : Windows.UI.WebUI.Core.VectorChangedEventHandler_IWebUICommandBarElement
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_VectorChanged
   (
      This       : access IObservableVector_IWebUICommandBarElement_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_MenuOpenedEventHandler : aliased constant Windows.IID := (417073875, 26511, 19481, (137, 99, 204, 28, 73, 165, 239, 158 ));
   
   type MenuOpenedEventHandler_Interface(Callback : access procedure) is new Windows.IMulticastDelegate_Interface(IID_MenuOpenedEventHandler'access) with null record;
   function Invoke
   (
      This       : access MenuOpenedEventHandler_Interface
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_MenuClosedEventHandler : aliased constant Windows.IID := (1129547720, 19920, 19538, (148, 137, 211, 144, 206, 119, 33, 210 ));
   
   type MenuClosedEventHandler_Interface(Callback : access procedure) is new Windows.IMulticastDelegate_Interface(IID_MenuClosedEventHandler'access) with null record;
   function Invoke
   (
      This       : access MenuClosedEventHandler_Interface
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_SizeChangedEventHandler : aliased constant Windows.IID := (3567058492, 56622, 19496, (182, 39, 48, 58, 127, 145, 26, 245 ));
   
   type SizeChangedEventHandler_Interface(Callback : access procedure (eventArgs : Windows.UI.WebUI.Core.IWebUICommandBarSizeChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_SizeChangedEventHandler'access) with null record;
   function Invoke
   (
      This       : access SizeChangedEventHandler_Interface
      ; eventArgs : Windows.UI.WebUI.Core.IWebUICommandBarSizeChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked : aliased constant Windows.IID := (3314014488, 35242, 21962, (149, 176, 193, 74, 7, 165, 50, 23 ));
   
   type TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked_Interface(Callback : access procedure (sender : Windows.UI.WebUI.Core.IWebUICommandBarIconButton ; args : Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebUICommandBarIconButton_add_ItemInvoked_Interface
      ; sender : Windows.UI.WebUI.Core.IWebUICommandBarIconButton
      ; args : Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked : aliased constant Windows.IID := (284181327, 34830, 20554, (156, 225, 36, 177, 65, 73, 33, 59 ));
   
   type TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked_Interface(Callback : access procedure (sender : Windows.UI.WebUI.Core.IWebUICommandBarConfirmationButton ; args : Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked'access) with null record;
   function Invoke
   (
      This       : access TypedEventHandler_IWebUICommandBarConfirmationButton_add_ItemInvoked_Interface
      ; sender : Windows.UI.WebUI.Core.IWebUICommandBarConfirmationButton
      ; args : Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   
   IID_VectorChangedEventHandler_IWebUICommandBarElement : aliased constant Windows.IID := (1117353081, 52210, 23161, (149, 96, 221, 126, 124, 65, 58, 244 ));
   
   type VectorChangedEventHandler_IWebUICommandBarElement_Interface(Callback : access procedure (sender : Windows.UI.WebUI.Core.IObservableVector_IWebUICommandBarElement ; event : Windows.Foundation.Collections.IVectorChangedEventArgs)) is new Windows.IMulticastDelegate_Interface(IID_VectorChangedEventHandler_IWebUICommandBarElement'access) with null record;
   function Invoke
   (
      This       : access VectorChangedEventHandler_IWebUICommandBarElement_Interface
      ; sender : Windows.UI.WebUI.Core.IObservableVector_IWebUICommandBarElement
      ; event : Windows.Foundation.Collections.IVectorChangedEventArgs
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype WebUICommandBarItemInvokedEventArgs is Windows.UI.WebUI.Core.IWebUICommandBarItemInvokedEventArgs;
   subtype WebUICommandBarIconButton is Windows.UI.WebUI.Core.IWebUICommandBarIconButton;
   function Create return Windows.UI.WebUI.Core.IWebUICommandBarIconButton;
   
   subtype WebUICommandBarConfirmationButton is Windows.UI.WebUI.Core.IWebUICommandBarConfirmationButton;
   function Create return Windows.UI.WebUI.Core.IWebUICommandBarConfirmationButton;
   
   subtype WebUICommandBarBitmapIcon is Windows.UI.WebUI.Core.IWebUICommandBarBitmapIcon;
   function Create return Windows.UI.WebUI.Core.IWebUICommandBarBitmapIcon;
   
   function Create
   (
      uri : Windows.Foundation.IUriRuntimeClass
   )
   return Windows.UI.WebUI.Core.IWebUICommandBarBitmapIcon;
   
   subtype WebUICommandBarSymbolIcon is Windows.UI.WebUI.Core.IWebUICommandBarSymbolIcon;
   function Create return Windows.UI.WebUI.Core.IWebUICommandBarSymbolIcon;
   
   function Create
   (
      symbol : Windows.String
   )
   return Windows.UI.WebUI.Core.IWebUICommandBarSymbolIcon;
   
   subtype WebUICommandBarSizeChangedEventArgs is Windows.UI.WebUI.Core.IWebUICommandBarSizeChangedEventArgs;
   subtype WebUICommandBar is Windows.UI.WebUI.Core.IWebUICommandBar;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.UI.WebUI.Core.IWebUICommandBar;
   
end;
