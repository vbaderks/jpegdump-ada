-- Copyright (c) Victor Derks.
-- SPDX-License-Identifier: MIT

with Ada.Streams.Stream_IO;

package Jpeg_Reader is
   procedure Dump_Segments (File : Ada.Streams.Stream_IO.File_Type);
end Jpeg_Reader;