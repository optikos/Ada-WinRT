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
with Windows.Devices.HumanInterfaceDevice;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Devices.Input.Preview is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access TypedEventHandler_IGazeDeviceWatcherPreview_add_Added_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
      ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherAddedPreviewEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview(sender), Windows.Devices.Input.Preview.IGazeDeviceWatcherAddedPreviewEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGazeDeviceWatcherPreview_add_Removed_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
      ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherRemovedPreviewEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview(sender), Windows.Devices.Input.Preview.IGazeDeviceWatcherRemovedPreviewEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGazeDeviceWatcherPreview_add_Updated_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
      ; args : Windows.Devices.Input.Preview.IGazeDeviceWatcherUpdatedPreviewEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview(sender), Windows.Devices.Input.Preview.IGazeDeviceWatcherUpdatedPreviewEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGazeDeviceWatcherPreview_add_EnumerationCompleted_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview(sender), args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGazeInputSourcePreview_add_GazeMoved_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview
      ; args : Windows.Devices.Input.Preview.IGazeMovedPreviewEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Input.Preview.IGazeInputSourcePreview(sender), Windows.Devices.Input.Preview.IGazeMovedPreviewEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGazeInputSourcePreview_add_GazeEntered_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview
      ; args : Windows.Devices.Input.Preview.IGazeEnteredPreviewEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Input.Preview.IGazeInputSourcePreview(sender), Windows.Devices.Input.Preview.IGazeEnteredPreviewEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IGazeInputSourcePreview_add_GazeExited_Interface
      ; sender : Windows.Devices.Input.Preview.IGazeInputSourcePreview
      ; args : Windows.Devices.Input.Preview.IGazeExitedPreviewEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.Devices.Input.Preview.IGazeInputSourcePreview(sender), Windows.Devices.Input.Preview.IGazeExitedPreviewEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   function GetForCurrentView
   return Windows.Devices.Input.Preview.IGazeInputSourcePreview is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Input.Preview.GazeInputSourcePreview");
      m_Factory     : IGazeInputSourcePreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Input.Preview.IGazeInputSourcePreview;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGazeInputSourcePreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForCurrentView(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateWatcher
   return Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Devices.Input.Preview.GazeInputSourcePreview");
      m_Factory     : IGazeInputSourcePreviewStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Devices.Input.Preview.IGazeDeviceWatcherPreview;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IGazeInputSourcePreviewStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.CreateWatcher(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
end;
