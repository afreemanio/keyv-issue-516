import Keyv from 'keyv';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export function keyvInit(): Keyv<any, Record<string, unknown>> {
  if (process.env.KEYV_URI === undefined) {
    throw new Error('KEYV_URI is not defined');
  }

  const keyv = new Keyv(process.env.KEYV_URI);
  // Handle DB connection errors
  keyv.on('error', (err) => console.log('Connection Error', err));
  return keyv;
}
