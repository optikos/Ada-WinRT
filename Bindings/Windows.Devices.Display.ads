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
limited with Windows.Graphics;
with Windows.Foundation;
--------------------------------------------------------------------------------
package Windows.Devices.Display is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type DisplayMonitorConnectionKind is (
      Internal,
      Wired,
      Wireless,
      Virtual
   );
   for DisplayMonitorConnectionKind use (
      Internal => 0,
      Wired => 1,
      Wireless => 2,
      Virtual => 3
   );
   for DisplayMonitorConnectionKind'Size use 32;
   
   type DisplayMonitorConnectionKind_Ptr is access DisplayMonitorConnectionKind;
   
   type DisplayMonitorPhysicalConnectorKind is (
      Unknown,
      HD15,
      AnalogTV,
      Dvi,
      Hdmi,
      Lvds,
      Sdi,
      DisplayPort
   );
   for DisplayMonitorPhysicalConnectorKind use (
      Unknown => 0,
      HD15 => 1,
      AnalogTV => 2,
      Dvi => 3,
      Hdmi => 4,
      Lvds => 5,
      Sdi => 6,
      DisplayPort => 7
   );
   for DisplayMonitorPhysicalConnectorKind'Size use 32;
   
   type DisplayMonitorPhysicalConnectorKind_Ptr is access DisplayMonitorPhysicalConnectorKind;
   
   type DisplayMonitorDescriptorKind is (
      Edid,
      DisplayId
   );
   for DisplayMonitorDescriptorKind use (
      Edid => 0,
      DisplayId => 1
   );
   for DisplayMonitorDescriptorKind'Size use 32;
   
   type DisplayMonitorDescriptorKind_Ptr is access DisplayMonitorDescriptorKind;
   
   type DisplayMonitorUsageKind is (
      Standard_x,
      HeadMounted,
      SpecialPurpose
   );
   for DisplayMonitorUsageKind use (
      Standard_x => 0,
      HeadMounted => 1,
      SpecialPurpose => 2
   );
   for DisplayMonitorUsageKind'Size use 32;
   
   type DisplayMonitorUsageKind_Ptr is access DisplayMonitorUsageKind;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IDisplayMonitor_Interface;
   type AsyncOperationCompletedHandler_IDisplayMonitor is access all AsyncOperationCompletedHandler_IDisplayMonitor_Interface'Class;
   type AsyncOperationCompletedHandler_IDisplayMonitor_Ptr is access all AsyncOperationCompletedHandler_IDisplayMonitor;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IDisplayMonitor_Interface;
   type IDisplayMonitor is access all IDisplayMonitor_Interface'Class;
   type IDisplayMonitor_Ptr is access all IDisplayMonitor;
   type IDisplayMonitorStatics_Interface;
   type IDisplayMonitorStatics is access all IDisplayMonitorStatics_Interface'Class;
   type IDisplayMonitorStatics_Ptr is access all IDisplayMonitorStatics;
   type IAsyncOperation_IDisplayMonitor_Interface;
   type IAsyncOperation_IDisplayMonitor is access all IAsyncOperation_IDisplayMonitor_Interface'Class;
   type IAsyncOperation_IDisplayMonitor_Ptr is access all IAsyncOperation_IDisplayMonitor;
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_IDisplayMonitor : aliased constant Windows.IID := (527111636, 7425, 19537, (135, 226, 111, 149, 74, 119, 43, 89 ));
   
   type IDisplayMonitor_Interface is interface and Windows.IInspectable_Interface;
   
   function get_DeviceId
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_ConnectionKind
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Devices.Display.DisplayMonitorConnectionKind
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalConnector
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Devices.Display.DisplayMonitorPhysicalConnectorKind
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayAdapterDeviceId
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayAdapterId
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Graphics.DisplayAdapterId
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayAdapterTargetId
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_UsageKind
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Devices.Display.DisplayMonitorUsageKind
   )
   return Windows.HRESULT is abstract;
   
   function get_NativeResolutionInRawPixels
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Graphics.SizeInt32
   )
   return Windows.HRESULT is abstract;
   
   function get_PhysicalSizeInInches
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Foundation.IReference_Size -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_RawDpiX
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RawDpiY
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_RedPrimary
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_GreenPrimary
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_BluePrimary
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_WhitePoint
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Foundation.Point
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxLuminanceInNits
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_MinLuminanceInNits
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function get_MaxAverageFullFrameLuminanceInNits
   (
      This       : access IDisplayMonitor_Interface
      ; RetVal : access Windows.Single
   )
   return Windows.HRESULT is abstract;
   
   function GetDescriptor
   (
      This       : access IDisplayMonitor_Interface
      ; descriptorKind : Windows.Devices.Display.DisplayMonitorDescriptorKind
      ; RetVal : access UInt8_Ptr -- Array Parameter type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IDisplayMonitorStatics : aliased constant Windows.IID := (1856924047, 41512, 19461, (130, 29, 182, 149, 214, 103, 222, 142 ));
   
   type IDisplayMonitorStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeviceSelector
   (
      This       : access IDisplayMonitorStatics_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function FromIdAsync
   (
      This       : access IDisplayMonitorStatics_Interface
      ; deviceId : Windows.String
      ; RetVal : access Windows.Devices.Display.IAsyncOperation_IDisplayMonitor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FromInterfaceIdAsync
   (
      This       : access IDisplayMonitorStatics_Interface
      ; deviceInterfaceId : Windows.String
      ; RetVal : access Windows.Devices.Display.IAsyncOperation_IDisplayMonitor -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   
   IID_IAsyncOperation_IDisplayMonitor : aliased constant Windows.IID := (683730467, 20038, 22723, (173, 130, 80, 43, 222, 204, 67, 69 ));
   
   type IAsyncOperation_IDisplayMonitor_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IDisplayMonitor_Interface
      ; handler : Windows.Devices.Display.AsyncOperationCompletedHandler_IDisplayMonitor
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IDisplayMonitor_Interface
      ; RetVal : access Windows.Devices.Display.AsyncOperationCompletedHandler_IDisplayMonitor
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IDisplayMonitor_Interface
      ; RetVal : access Windows.Devices.Display.IDisplayMonitor
   )
   return Windows.HRESULT is abstract;
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   
   IID_AsyncOperationCompletedHandler_IDisplayMonitor : aliased constant Windows.IID := (1645163688, 23994, 23007, (183, 25, 153, 183, 121, 112, 52, 76 ));
   
   type AsyncOperationCompletedHandler_IDisplayMonitor_Interface(Callback : access procedure (asyncInfo : Windows.Devices.Display.IAsyncOperation_IDisplayMonitor ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface(IID_AsyncOperationCompletedHandler_IDisplayMonitor'access) with null record;
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IDisplayMonitor_Interface
      ; asyncInfo : Windows.Devices.Display.IAsyncOperation_IDisplayMonitor
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype DisplayMonitor is Windows.Devices.Display.IDisplayMonitor;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   function GetDeviceSelector
   return Windows.String;
   
   function FromIdAsync
   (
      deviceId : Windows.String
   )
   return Windows.Devices.Display.IAsyncOperation_IDisplayMonitor;
   
   function FromInterfaceIdAsync
   (
      deviceInterfaceId : Windows.String
   )
   return Windows.Devices.Display.IAsyncOperation_IDisplayMonitor;
   
end;
