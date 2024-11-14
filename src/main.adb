-- Copyright (c) Victor Derks.
-- SPDX-License-Identifier: MIT

with Ada.Command_Line;
with Ada.Streams.Stream_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;  use Ada.Exceptions;
with Jpeg_Reader;

procedure Main is
   File     : Ada.Streams.Stream_IO.File_Type;
begin
   if Ada.Command_Line.Argument_Count < 1 then
      Put_Line("Usage: jpegdump <filename>");
      return;
   end if;

   Ada.Streams.Stream_IO.Open(File => File,
                              Mode => Ada.Streams.Stream_IO.In_File,
                              Name => Ada.Command_Line.Argument (1));
   Jpeg_Reader.Dump_Segments(File);
   Ada.Streams.Stream_IO.Close(File);
exception
   when Name_Error =>
      Put ("Cannot open input file");

end Main;
