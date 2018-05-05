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
with Windows.UI;
with Windows.Web;
with Windows.Web.Http;
with Windows.Storage.Streams;
with Windows.ApplicationModel.DataTransfer;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Web.UI is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IWebViewControl_Interface
      ; asyncInfo : Windows.Web.UI.IAsyncOperation_IWebViewControl
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_NavigationStarting_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNavigationStartingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlNavigationStartingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_ContentLoading_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlContentLoadingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlContentLoadingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_DOMContentLoaded_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_NavigationCompleted_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_FrameNavigationStarting_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNavigationStartingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlNavigationStartingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_FrameContentLoading_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlContentLoadingEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlContentLoadingEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_FrameDOMContentLoaded_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlDOMContentLoadedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_FrameNavigationCompleted_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlNavigationCompletedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_ScriptNotify_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlScriptNotifyEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlScriptNotifyEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_LongRunningScriptDetected_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlLongRunningScriptDetectedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlLongRunningScriptDetectedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_UnsafeContentWarningDisplaying_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_UnviewableContentIdentified_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlUnviewableContentIdentifiedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlUnviewableContentIdentifiedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_PermissionRequested_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlPermissionRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlPermissionRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_UnsupportedUriSchemeIdentified_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlUnsupportedUriSchemeIdentifiedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_NewWindowRequested_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlNewWindowRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlNewWindowRequestedEventArgs(args));
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_ContainsFullScreenElementChanged_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, args);
      return Hr;
   end;
   
   function Invoke
   (
      This       : access TypedEventHandler_IWebViewControl_add_WebResourceRequested_Interface
      ; sender : Windows.Web.UI.IWebViewControl
      ; args : Windows.Web.UI.IWebViewControlWebResourceRequestedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(sender, Windows.Web.UI.IWebViewControlWebResourceRequestedEventArgs(args));
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
   
end;