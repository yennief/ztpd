let $doc := doc("db/bib/bib.xml")

(:return $doc//author/last:)

(:
for $book in $doc//book
for $title in $book/title
for $author in $book/author
  return 
  <ksiazka>
    {$author}
    {$title}
  </ksiazka>
:)

(:
for $book in $doc//book
for $title in $book/title
for $author in $book/author
  return 
  <ksiazka>
    <autor>
      {$author/first/text()} 
      {$author/last/text()}
    </autor>
    <tytul>
      {$title/text()}
    </tytul>
    {$title}
  </ksiazka>
:)

(:
for $book in $doc//book
for $title in $book/title
for $author in $book/author
  return 
  <ksiazka>
    <autor>
      {concat($author/first/text(), " ", $author/last/text())}
    </autor>
    <tytul>
      {$title/text()}
    </tytul>
    {$title}
  </ksiazka>
:)

(:
for $book in $doc//book
for $title in $book/title
for $author in $book/author
  return
  <wynik>
    {
      <ksiazka>
        <autor>
          {concat($author/first/text(), " ", $author/last/text())}
        </autor>
        <tytul>
          {$title/text()}
        </tytul>
        {$title}
      </ksiazka>
    }
  </wynik>
:)

(:
for $book in $doc//book[title = 'Data on the Web']
return 
  <imiona>
    {
      for $author in $book/author/first/text()
      return <imie>{$author}</imie>
    }
  </imiona>
:)

(:
for $book in $doc//book[title = 'Data on the Web']
return 
  <DataOnTheWeb>
    {$book}
  </DataOnTheWeb>
:)

(:
for $book in $doc//book where $book/title = 'Data on the Web'
return 
  <DataOnTheWeb>
    {$book}
  </DataOnTheWeb>
:)

(:
for $book in $doc//book
  where contains($book/title/text(), 'Data')

return
  <Data>
    {
      for $author in $book/author
      return 
        <nazwisko>
          {$author/last/text()}
        </nazwisko>
    }
  </Data>
:)

(:
for $book in $doc//book
  where contains($book/title/text(), 'Data')

return
  <Data>
    <title>{$book/title/text()}</title>
    {
      for $author in $book/author
      return 
        <nazwisko>
          {$author/last/text()}
        </nazwisko>
    }
  </Data>
:)

(:
for $book in $doc//book
  where count($book/author) <= 2

return
  <title> {$book/title/text()} </title>
:)

(:
for $book in $doc//book
let $author := $book/author
return
  <ksiazka>
    {$book/title}
    <autorow>
      {count($author)}
    </autorow>
  </ksiazka>
:)

(:
let $min := min($doc//book/@year)
let $max := max($doc//book/@year)
return
  <przedzial>
    {concat($min, ' - ', $max)}
  </przedzial>
:)

(:
let $min := min($doc//book/price)
let $max := max($doc//book/price)
return
  <przedzial>
    {$max - $min}
  </przedzial>
:)

(:
let $min := min($doc//book/price)
return
  <najtansze>
    {
      for $book in $doc//book
          where $book/price = $min
      return
        <najtansza>
           {$book/title}
           {$book/author}
        </najtansza>
    }
  </najtansze>
:)

(:for $author in distinct-values($doc//book/author/last):)
(:let $book := $doc//book[author/last = $author]/title:)
(:return:)
(:  <autor>:)
(:    <last>{$author}</last>:)
(:    {$book}:)
(:  </autor>:)


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  